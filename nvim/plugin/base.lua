vim.pack.add {
    {
        src = "https://github.com/nvim-lua/plenary.nvim",
        version = "master",
    },
    {
        src = "https://github.com/sainnhe/everforest",
        version = "master",
    },
    {
        src = "https://github.com/nvim-mini/mini.icons",
        version = "main",
    },
}

vim.g.everforest_background = "hard"
vim.g.everforest_better_performance = 1
vim.cmd.colorscheme "everforest"

require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()
require("mini.icons").tweak_lsp_kind()

