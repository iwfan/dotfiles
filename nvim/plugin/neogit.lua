-- ============================================================================
-- Neogit — interactive git UI (Magit-style)
-- ============================================================================

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
        require("neogit").setup {
            integrations = {
                diffview = true,
            },
        }

        vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<CR>", { desc = "Open Neogit" })
    end,
})
