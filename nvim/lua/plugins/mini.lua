return {
    {
        'echasnovski/mini.comment',
        version = false,
        opts = {
            options = {
                custom_commentstring = function()
                    return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
                end,
            },
            mappings = {
                comment_line = "<C-c>",
                comment_visual = "<C-c>",
            }
        },
        event = "VeryLazy",
    },
    {
        'echasnovski/mini.surround',
        version = false,
        opts = {
            mappings = {
                add = 'sa', -- Add surrounding in Normal and Visual modes
                delete = 'sd', -- Delete surrounding
                find = 'sl', -- Find surrounding (to the right)
                find_left = 'sh', -- Find surrounding (to the left)
                highlight = 'ss', -- Highlight surrounding
                replace = 'sr', -- Replace surrounding
                update_n_lines = '', -- Update `n_lines`

                suffix_last = 'l', -- Suffix to search with "prev" method
                suffix_next = 'n', -- Suffix to search with "next" method
            },
        },
        event = "VeryLazy"
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
