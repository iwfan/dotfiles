local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup("iwfan_" .. name, { clear = true })
end

-- === 文件监控和重载 ===
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup "checktime",
    desc = "Check if file needs to be reloaded",
    command = "checktime",
})

-- 粘贴时自动调整缩进
autocmd("TextChanged", {
    group = augroup("smart_paste"),
    desc = "Auto-adjust indentation after paste",
    callback = function()
        if vim.b.pasted then
            vim.cmd("normal! =`[`]")
            vim.b.pasted = false
        end
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

-- === 高亮复制内容 ===
autocmd("TextYankPost", {
    group = augroup "highlight_yank",
    desc = "Highlight yanked text",
    callback = function()
        vim.highlight.on_yank({ timeout = 200 })
    end,
})

-- === 终端设置 ===
autocmd("TermOpen", {
    group = augroup "term_open",
    desc = "Terminal setup",
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.scrolloff = 0
        vim.opt_local.sidescrolloff = 0
        vim.bo.filetype = "terminal"
        vim.bo.buflisted = false
    end,
})

-- Auto insert mode in terminal
autocmd({ "WinEnter", "BufWinEnter", "TermOpen" }, {
    group = augroup "term_insert",
    desc = "Start insert mode when entering terminal",
    callback = function(args)
        if vim.startswith(vim.api.nvim_buf_get_name(args.buf), "term://") then
            vim.cmd("startinsert")
        end
    end,
})

-- Enable wrap and spell for certain filetypes
autocmd("FileType", {
    group = augroup "wrap_spell",
    pattern = { "*.txt", "*.md", "*.tex", "gitcommit", "markdown" },
    desc = "Enable wrap and spell for text-like files",
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
        vim.opt_local.conceallevel = 2
    end,
})

-- Auto create parent directories when saving a file
autocmd("BufWritePre", {
    group = augroup "auto_create_dir",
    desc = "Create parent directories if they don't exist",
    callback = function(event)
        if event.match:match("^%w%w+://") then -- URL
            return
        end

        local file = vim.loop.fs_realpath(event.match) or event.match
        local dir = vim.fn.fnamemodify(file, ":p:h")

        if vim.fn.isdirectory(dir) == 0 then
            vim.fn.mkdir(dir, "p")
            vim.notify("Created directory: " .. dir, vim.log.levels.INFO)
        end
    end,
})

-- === 格式化选项管理 ===
autocmd("BufEnter", {
    group = augroup "format_options",
    desc = "Set format options",
    callback = function()
        vim.opt_local.formatoptions:remove({ "c", "r", "o" })
    end,
})

-- === 大文件优化 ===
autocmd("BufReadPre", {
    group = augroup "big_file",
    desc = "Optimize for big files",
    callback = function(event)
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(event.buf))
        if ok and stats and stats.size > 1024 * 1024 then -- 1MB
            vim.b[event.buf].big_file = true
            vim.opt_local.spell = false
            vim.opt_local.swapfile = false
            vim.opt_local.undofile = false
            vim.opt_local.breakindent = false
            vim.opt_local.colorcolumn = ""
            vim.opt_local.statuscolumn = ""
            vim.opt_local.signcolumn = "no"
            vim.opt_local.foldcolumn = "0"
            vim.opt_local.winbar = ""
            vim.schedule(function()
                vim.bo[event.buf].syntax = ""
            end)
        end
    end,
})

-- === 自动保存 ===
autocmd({ "InsertLeave", "TextChanged" }, {
    group = augroup "auto_save",
    desc = "Auto save when leaving insert mode or text changed",
    callback = function(event)
        if vim.bo[event.buf].modified and vim.bo[event.buf].buftype == "" and vim.fn.expand("%") ~= "" then
            vim.cmd("silent! write")
        end
    end,
})

-- === 智能关闭某些文件类型 ===
autocmd("FileType", {
    group = augroup "close_with_q",
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
        "query",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "neotest-output",
        "checkhealth",
        "neotest-summary",
        "neotest-output-panel",
    },
    callback = function(event)
        vim.bo[event.buf].buflisted = false
        vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
    end,
})
