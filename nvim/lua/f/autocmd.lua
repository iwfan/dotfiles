local autocmd_group = vim.api.nvim_create_augroup("neovim_autocmd", { clear = true })

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead", "FileType" }, {
    group = autocmd_group,
    callback = function()
        if string.find(vim.o.fo, "o") then
            vim.opt.formatoptions = vim.opt.formatoptions
                - "o" -- O and o, don't continue comments
                + "r" -- But do continue when pressing enter.
        end
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
