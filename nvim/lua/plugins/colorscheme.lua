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
        "sainnhe/gruvbox-material",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_better_performance = 1
            -- vim.cmd.colorscheme "gruvbox-material"
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
