vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
        require("mini.pairs").setup {
            modes = { command = true },
        }
    end,
})
