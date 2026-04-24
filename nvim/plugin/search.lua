vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        vim.pack.add {
            {
                src = "https://github.com/ibhagwan/fzf-lua",
                version = "main",
            },
        }

        require("fzf-lua").setup {
            { "fzf-native", "hide" },
            winopts = { fullscreen = true },
        }
        require("fzf-lua").register_ui_select()
        vim.keymap.set("n", "<C-p>", "<cmd>FzfLua combine pickers=oldfiles;files<cr>")
        vim.keymap.set("n", "<C-f>", "<cmd>FzfLua live_grep<cr>")
        vim.keymap.set("n", "<C-\\>", "<cmd>FzfLua resume<cr>")
    end,
})
