vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
        require("mini.bufremove").setup()
        vim.keymap.set("n", "<leader>x", "<cmd>lua MiniBufremove.delete()<cr>")
    end,
})
