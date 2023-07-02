return {
    {
        "nvim-telescope/telescope.nvim",
        version = "*",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.telescope"
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        event = "VeryLazy",
        config = function()
            require "plugins.configs.gitsigns"
        end,
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
    {
        "nvim-pack/nvim-spectre",
        event = "VeryLazy",
        opts = { open_cmd = "noswapfile vnew" },
        keys = {
            {
                "<M-f>",
                mode = "n",
                function()
                    require("spectre").open_visual { select_word = true }
                end,
                desc = "Spectre",
            },
            {
                "<M-f>",
                mode = "v",
                function()
                    require("spectre").open_visual()
                end,
                desc = "Spectre",
            },
        },
    },
}
