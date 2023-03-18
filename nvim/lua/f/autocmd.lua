local autocmd = vim.api.nvim_create_autocmd

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, { command = "checktime" })

autocmd({ "BufNewFile", "BufRead", "FileType" }, {
    callback = function()
        if string.find(vim.o.fo, "o") then
            vim.opt.formatoptions = vim.opt.formatoptions
                - "o" -- O and o, don't continue comments
                + "r" -- But do continue when pressing enter.
        end
    end,
})

autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    callback = function()
        vim.cmd "tabdo wincmd ="
    end,
})

-- https://github.com/mhinz/vim-galore#smarter-cursorline
autocmd({ "InsertLeave", "WinEnter" }, {
    callback = function()
        vim.opt_local.cursorline = true
        vim.opt_local.relativenumber = true
    end,
})
autocmd({ "InsertEnter", "WinLeave " }, {
    callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.relativenumber = false
    end,
})

autocmd("BufWritePre", {
    callback = function()
        vim.fn.execute [[%s/\s\+$//e]]
        vim.fn.execute [[%s/\n\+\%$//e]]
    end,
})

autocmd("FileType", {
    pattern = {
        "qf",
        "help",
        "man",
        "notify",
        "lspinfo",
        "spectre_panel",
        "startuptime",
        "tsplayground",
        "PlenaryTestPopup",
    },
    callback = function()
        vim.opt_local.buflisted = false
    end,
})

autocmd("FileType", {
    pattern = { "gitcommit", "markdown" },
    callback = function()
        vim.opt_local.wrap = true
        vim.opt_local.spell = true
    end,
})
