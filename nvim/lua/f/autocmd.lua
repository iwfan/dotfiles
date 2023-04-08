local autocmd = vim.api.nvim_create_autocmd

autocmd({ "BufNewFile", "BufRead", "FileType" }, {
    callback = function()
        if string.find(vim.o.fo, "o") then
            vim.opt.formatoptions = vim.opt.formatoptions
                - "o" -- O and o, don't continue comments
                + "r" -- But do continue when pressing enter.
        end
    end,
})

-- https://github.com/mhinz/vim-galore#smarter-cursorline
autocmd({ "InsertLeave", "WinEnter" }, {
    callback = function()
        if not vim.tbl_contains({ "term", "help", "dashboard" }, vim.bo.filetype) then
            vim.opt_local.cursorline = true
            vim.opt_local.relativenumber = true
        end
    end,
})
autocmd({ "InsertEnter", "WinLeave " }, {
    callback = function()
        vim.opt_local.cursorline = false
        vim.opt_local.relativenumber = false
    end,
})

autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})

autocmd("TermOpen", {
    pattern = { "term://*" },
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.bo.filetype = "term"
        vim.cmd "startinsert"
    end,
})

autocmd("TermClose", {
    pattern = { "term://*" },
    callback = function()
        vim.cmd "bd"
    end,
})

-- resize splits if window got resized
autocmd({ "VimResized" }, {
    callback = function()
        vim.cmd "tabdo wincmd ="
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
