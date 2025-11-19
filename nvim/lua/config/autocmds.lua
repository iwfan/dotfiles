local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup("iwfan_" .. name, { clear = true })
end

-- === 高亮复制内容 ===
autocmd("TextYankPost", {
    group = augroup "highlight_yank",
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- === 光标位置恢复 ===
autocmd("BufReadPost", {
    group = augroup "last_loc",
    desc = "Restore cursor position",
    callback = function(event)
        local exclude = { "gitcommit" }
        local buf = event.buf
        if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
            return
        end
        vim.b[buf].lazyvim_last_loc = true
        local mark = vim.api.nvim_buf_get_mark(buf, '"')
        local lcount = vim.api.nvim_buf_line_count(buf)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- === 终端设置 ===
autocmd("TermOpen", {
    group = augroup "term_open",
    desc = "Terminal setup",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = "no"
        vim.opt_local.scrolloff = 0
        vim.opt_local.sidescrolloff = 0
        vim.bo.buflisted = false
        vim.cmd("startinsert")
    end,
})

-- === 格式化选项管理 ===
autocmd("BufEnter", {
    group = augroup "fix_formatoptions",
    callback = function()
        if vim.bo.filetype ~= "" then
            vim.opt.formatoptions = "jqlnt"
        end
    end,
})

-- === 智能关闭某些文件类型 ===
local unlisted_ft = {
    help = true,
    qf = true,
    notify = true,
    lspinfo = true,
}

autocmd("FileType", {
    group = augroup "smart_close",
    callback = function(ev)
        if unlisted_ft[vim.bo[ev.buf].filetype] then
            vim.bo[ev.buf].buflisted = false
            vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = ev.buf, silent = true })
        end
    end,
})
