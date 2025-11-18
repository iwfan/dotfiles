return {
    {
        "MagicDuck/grug-far.nvim",
        cmd = "GrugFar",
        opts = {
            windowCreationCommand = "tabnew",
            transient = true,
        },
        keys = {
            {
                "<A-f>",
                mode = "n",
                function()
                    require("grug-far").open { prefills = { search = vim.fn.expand "<cword>" } }
                end,
                desc = "GrugFar",
            },
            {
                "<A-f>",
                mode = "v",
                function()
                    require("grug-far").with_visual_selection { prefills = { paths = vim.fn.expand "%" } }
                end,
                desc = "GrugFar",
            },
        },
    },
    {
        "andymass/vim-matchup",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            vim.g.matchup_matchparen_offscreen = {}
        end,
    },
    {
        "folke/flash.nvim",
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
