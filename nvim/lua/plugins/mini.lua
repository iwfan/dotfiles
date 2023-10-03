return {
    {
        "echasnovski/mini.move",
        version = false,
        opts = {},
        keys = {
            {
                "<M-j>",
                mode = { "i" },
                function()
                    MiniMove.move_line "down"
                end,
                desc = "Move line down",
            },
            {
                "<M-k>",
                mode = { "i" },
                function()
                    MiniMove.move_line "up"
                end,
                desc = "Move line down",
            },
            {
                "<M-h>",
                mode = { "i" },
                function()
                    MiniMove.move_line "left"
                end,
                desc = "Move line down",
            },
            {
                "<M-l>",
                mode = { "i" },
                function()
                    MiniMove.move_line "right"
                end,
                desc = "Move line down",
            },
        },
        event = "VeryLazy",
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
