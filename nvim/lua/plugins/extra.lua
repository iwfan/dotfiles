return {
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.gitsigns"
        end,
    },
    {
        "NeogitOrg/neogit",
        opts = {},
        dependencies = "nvim-lua/plenary.nvim",
        event = "VeryLazy",
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.toggleterm"
        end,
    },
    {
        "sindrets/diffview.nvim",
        event = "VeryLazy",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        opts = {},
    },
}
