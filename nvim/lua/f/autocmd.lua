local autocmd_group = vim.api.nvim_create_augroup("neovim_autocmd", { clear = true })

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "WinEnter" }, {
    group = autocmd_group,
    callback = function()
        if vim.o.nu and vim.fn.mode() ~= "i" then
            vim.o.rnu = true
        end
        vim.o.cul = true
    end,
})

vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter", "WinLeave" }, {
    group = autocmd_group,
    callback = function()
        if vim.o.nu then
            vim.o.rnu = false
        end
        vim.o.cul = false
    end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = autocmd_group,
    callback = function()
        vim.opt.formatoptions = vim.opt.formatoptions
            - "o" -- O and o, don't continue comments
            + "r" -- But do continue when pressing enter.
    end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
    group = autocmd_group,
    callback = function()
        vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
    end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
    group = autocmd_group,
    callback = function()
        vim.fn.execute [[%s/\s\+$//e]]
        vim.fn.execute [[%s/\n\+\%$//e]]
    end,
})
