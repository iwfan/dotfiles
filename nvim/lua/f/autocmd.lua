local autocmd = vim.api.nvim_create_autocmd
local function augroup(name)
    return vim.api.nvim_create_augroup("iwfan_" .. name, { clear = true })
end

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
    group = augroup "checktime",
    command = "checktime",
})

-- https://github.com/mhinz/vim-galore#smarter-cursorline
autocmd({ "InsertLeave", "WinEnter" }, {
    group = augroup "show_cursorline",
    callback = function()
        if not vim.tbl_contains({ "term", "help", "dashboard", "starter" }, vim.bo.filetype) then
            vim.opt_local.cursorline = true
            vim.opt_local.relativenumber = true
        end
    end,
})
autocmd({ "InsertEnter", "WinLeave" }, {
    group = augroup "hide_cursorline",
    callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.relativenumber = false
    end,
})

-- go to last loc when opening a buffer
autocmd("BufReadPost", {
    group = augroup "last_loc",
    callback = function()
        if not vim.tbl_contains({ "term", "help", "dashboard", "starter", "gitcommit" }, vim.bo.filetype) then
            local mark = vim.api.nvim_buf_get_mark(0, '"')
            local lcount = vim.api.nvim_buf_line_count(0)
            if mark[1] > 0 and mark[1] <= lcount then
                pcall(vim.api.nvim_win_set_cursor, 0, mark)
            end
        end
    end,
})

autocmd("TextYankPost", {
    group = augroup "highlight_yank",
    callback = function()
        vim.highlight.on_yank()
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    group = augroup "resize_splits",
    callback = function()
        vim.cmd "tabdo wincmd ="
    end,
})

autocmd("TermOpen", {
    group = augroup "term_open",
    pattern = { "term://*" },
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.bo.filetype = "term"
        vim.cmd "startinsert"
    end,
})

autocmd("TermClose", {
    group = augroup "term_close",
    pattern = { "term://*" },
    callback = function()
        vim.cmd "bd"
    end,
})

autocmd("FileType", {
    group = augroup "close_with_q",
    pattern = {
        "PlenaryTestPopup",
        "help",
        "lspinfo",
        "man",
        "notify",
        "qf",
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

autocmd("FileType", {
    group = augroup "wrap_spell",
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})

autocmd("BufWritePre", {
    group = augroup "auto_trim",
    callback = function()
        vim.fn.execute [[%s/\s\+$//e]]
        vim.fn.execute [[%s/\n\+\%$//e]]
    end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
autocmd({ "BufWritePre" }, {
    group = augroup "auto_create_dir",
    callback = function(event)
        if event.match:match "^%w%w+://" then
            return
        end
        local file = vim.loop.fs_realpath(event.match) or event.match
        vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
    end,
})

autocmd({ "BufNewFile", "BufRead", "FileType" }, {
    group = augroup "formatoptions",
    callback = function()
        if string.find(vim.o.fo, "o") then
            vim.opt.formatoptions = vim.opt.formatoptions
                - "o" -- O and o, don't continue comments
                + "r" -- But do continue when pressing enter.
        end
    end,
})
