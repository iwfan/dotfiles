return {
    {
        "sainnhe/everforest",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_background = "medium"
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme "everforest"
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            -- vim.cmd.colorscheme "tokyonight"
        end,
    },
}
