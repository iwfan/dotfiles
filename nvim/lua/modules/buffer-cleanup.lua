local M = {}

-- 状态跟踪
local pending_deletes = {}
local cleanup_stats = { deleted = 0, errors = 0 }

-- 检查是否应该删除缓冲区
local function should_delete_buffer(bufnr, bufname)
    -- 基础检查
    if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
        return false
    end

    if bufname == "" or bufname:match("^%w+://") then
        return false
    end

    -- 缓冲区状态检查
    local buftype = vim.bo[bufnr].buftype
    local filetype = vim.bo[bufnr].filetype
    local modified = vim.bo[bufnr].modified

    -- 受保护的类型
    local protected_buftypes = {
        "terminal", "quickfix", "help", "prompt", "nofile", "acwrite"
    }
    local protected_filetypes = {
        "netrw", "fugitive", "gitcommit", "alpha", "dashboard", "lazy", "mason"
    }

    if vim.tbl_contains(protected_buftypes, buftype) or
        vim.tbl_contains(protected_filetypes, filetype) or
        modified then
        return false
    end

    -- 文件存在性检查
    return vim.fn.filereadable(bufname) == 0 and vim.fn.isdirectory(bufname) == 0
end

-- 安全删除缓冲区
local function safe_delete_buffer(bufnr, bufname)
    local success, err = pcall(function()
        -- 确保不是最后一个listed缓冲区
        local listed_bufs = vim.tbl_filter(function(b)
            return vim.api.nvim_buf_is_valid(b) and vim.bo[b].buflisted and b ~= bufnr
        end, vim.api.nvim_list_bufs())

        if #listed_bufs == 0 then
            -- 不删除最后一个缓冲区，而是清空它
            vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, {})
            vim.api.nvim_buf_set_name(bufnr, "")
            return
        end

        -- 尝试使用插件删除
        if vim.fn.exists(':Bdelete') == 2 then
            vim.cmd('silent! Bdelete! ' .. bufnr)
        elseif package.loaded.snacks and pcall(function() return Snacks.bufdelete end) then
            Snacks.bufdelete.delete(bufnr)
        else
            vim.cmd('silent! bdelete! ' .. bufnr)
        end

        cleanup_stats.deleted = cleanup_stats.deleted + 1
    end)

    if not success then
        cleanup_stats.errors = cleanup_stats.errors + 1

        -- 只记录重要错误
        if not err:match("No buffers were deleted") and
            not err:match("not found") then
            vim.schedule(function()
                vim.notify(
                    string.format("Buffer cleanup error [%d]: %s", bufnr, tostring(err):sub(1, 100)),
                    vim.log.levels.DEBUG -- 降低日志级别
                )
            end)
        end
    end
end

-- 主清理函数
local function cleanup_buffer(bufnr, bufname, retry_count)
    retry_count = retry_count or 0

    -- 防止无限重试
    if retry_count > 3 then
        pending_deletes[bufnr] = nil
        return
    end

    -- 再次验证
    if not vim.api.nvim_buf_is_valid(bufnr) then
        pending_deletes[bufnr] = nil
        return
    end

    local current_name = vim.api.nvim_buf_get_name(bufnr)
    if current_name ~= bufname then
        -- 缓冲区名称已改变，可能文件已创建
        pending_deletes[bufnr] = nil
        return
    end

    if should_delete_buffer(bufnr, bufname) then
        safe_delete_buffer(bufnr, bufname)
    end

    pending_deletes[bufnr] = nil
end

-- 设置自动命令
function M.setup()
    local augroup_id = vim.api.nvim_create_augroup("BufferCleanup", { clear = true })

    vim.api.nvim_create_autocmd("BufEnter", {
        group = augroup_id,
        desc = "Clean up buffers for non-existent files",
        callback = function(event)
            local bufnr = event.buf

            -- 防止重复处理
            if pending_deletes[bufnr] then
                return
            end

            local bufname = vim.api.nvim_buf_get_name(bufnr)

            if should_delete_buffer(bufnr, bufname) then
                pending_deletes[bufnr] = true

                -- 使用 vim.schedule 而不是 defer_fn，更轻量
                vim.schedule(function()
                    vim.defer_fn(function()
                        cleanup_buffer(bufnr, bufname)
                    end, 50) -- 减少延迟时间
                end)
            end
        end,
    })

    -- 退出时清理
    vim.api.nvim_create_autocmd("VimLeavePre", {
        group = augroup_id,
        callback = function()
            pending_deletes = {}
            if cleanup_stats.deleted > 0 or cleanup_stats.errors > 0 then
                print(string.format(
                    "Buffer cleanup: %d deleted, %d errors",
                    cleanup_stats.deleted,
                    cleanup_stats.errors
                ))
            end
        end,
    })
end

-- 手动清理函数
function M.cleanup_now()
    local deleted_count = 0
    for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_valid(bufnr) then
            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if should_delete_buffer(bufnr, bufname) then
                safe_delete_buffer(bufnr, bufname)
                deleted_count = deleted_count + 1
            end
        end
    end

    if deleted_count > 0 then
        vim.notify(string.format("Cleaned up %d buffers", deleted_count))
    end
end

-- 获取清理统计
function M.get_stats()
    return vim.deepcopy(cleanup_stats)
end

return M
