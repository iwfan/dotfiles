return {
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        opts = {},
    },
    { "windwp/nvim-ts-autotag", event = "VeryLazy", opts = {} },
    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        opts = {},
    },
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
        "mg979/vim-visual-multi",
        event = "VeryLazy",
        init = function()
            vim.g.VM_default_mappings = 0
            vim.g.VM_maps = {
                ["Add Cursor Down"] = "<A-n>",
                ["Add Cursor Up"] = "<A-p>",
            }
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
    {
        "folke/ts-comments.nvim",
        opts = {},
        event = "VeryLazy",
        enabled = vim.fn.has "nvim-0.10.0" == 1,
    },
    {
        "johmsalas/text-case.nvim",
        opts = {},
    },
    {
        "echasnovski/mini.bracketed",
        version = false,
        opts = {
            buffer = { suffix = "b", options = {} },
            comment = { suffix = "c", options = {} },
            conflict = { suffix = "x", options = {} },
            diagnostic = { suffix = "d", options = {} },
            file = { suffix = "", options = {} },
            jump = { suffix = "j", options = {} },
            location = { suffix = "l", options = {} },
            oldfile = { suffix = "o", options = {} },
            quickfix = { suffix = "q", options = {} },
            window = { suffix = "w", options = {} },
            indent = { suffix = "", options = {} },
            treesitter = { suffix = "", options = {} },
            undo = { suffix = "", options = {} },
            yank = { suffix = "", options = {} },
        },
    },
    { "echasnovski/mini.align", version = false, opts = {}, event = "VeryLazy" },
    {
        "echasnovski/mini.ai",
        version = false,
        dependencies = "nvim-treesitter/nvim-treesitter-textobjects",
        opts = function()
            local treesitter = require("mini.ai").gen_spec.treesitter
            return {
                n_lines = 500,
                custom_textobjects = {
                    a = treesitter { a = "@parameter.outer", i = "@parameter.inner" },
                    c = treesitter { a = "@class.outer", i = "@class.inner" },
                    f = treesitter { a = "@function.outer", i = "@function.inner" },
                    k = treesitter { a = "@block.outer", i = "@block.inner" },
                    l = treesitter { a = "@loop.outer", i = "@loop.inner" },
                    ["?"] = treesitter {
                        a = { "@conditional.outer", "@loop.outer" },
                        i = { "@conditional.inner", "@loop.inner" },
                    },
                },
            }
        end,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.hipatterns",
        version = false,
        opts = function()
            local hi = require "mini.hipatterns"
            return {
                highlighters = {
                    hex_color = hi.gen_highlighter.hex_color { priority = 2000 },
                },
            }
        end,
        event = "VeryLazy",
    },
}
