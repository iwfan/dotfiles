return {
    {
        "MagicDuck/grug-far.nvim",
        opts = {
            windowCreationCommand = "botright split",
            transient = true,
        },
        keys = {
            {
                "<A-f>",
                mode = "n",
                function()
                    require("grug-far").open { prefills = { search = vim.fn.expand "<cword>" } }
                end,
                desc = "Spectre",
            },
            {
                "<A-f>",
                mode = "v",
                function()
                    require("grug-far").with_visual_selection { prefills = { paths = vim.fn.expand "%" } }
                end,
                desc = "Spectre",
            },
        },
    },
    {
        "andymass/vim-matchup",
        event = "VeryLazy",
        config = function()
            vim.g.matchup_matchparen_offscreen = {}
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            modes = {
                search = {
                    enabled = false,
                },
            },
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump { multi_window = false }
                end,
                desc = "Flash",
            },
        },
    },
}
