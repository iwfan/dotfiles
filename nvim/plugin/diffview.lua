vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
    once = true,
    callback = function()
        require("diffview").setup {
            keymaps = {
                view = {
                    { { "n" }, "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
                },
                file_panel = {
                    { { "n" }, "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
                },
                file_history_panel = {
                    { { "n" }, "q", "<Cmd>DiffviewClose<CR>", { desc = "Close Diffview" } },
                },
            },
        }
    end,
})
