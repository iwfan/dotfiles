return {
    {
        "echasnovski/mini.files",
        version = false,
        opts = {},
        keys = {
            {
                "<Space>e",
                mode = "n",
                function()
                    MiniFiles.open(vim.fn.expand "%")
                end,
                desc = "MiniFiles",
            },
        },
        config = function ()
            require('mini.files').setup({})
            local map_split = function(buf_id, lhs, direction)
                local rhs = function()
                    -- Make new window and set it as target
                    local new_target_window
                    vim.api.nvim_win_call(MiniFiles.get_target_window(), function()
                        vim.cmd(direction .. ' split')
                        new_target_window = vim.api.nvim_get_current_win()
                    end)

                    MiniFiles.set_target_window(new_target_window)
                    MiniFiles.close()
                end

                -- Adding `desc` will result into `show_help` entries
                local desc = 'Split ' .. direction
                vim.keymap.set('n', lhs, rhs, { buffer = buf_id, desc = desc })
            end

            vim.api.nvim_create_autocmd('User', {
                pattern = 'MiniFilesBufferCreate',
                callback = function(args)
                    local buf_id = args.data.buf_id
                    -- Tweak keys to your liking
                    map_split(buf_id, '<C-s>', 'belowright horizontal')
                    map_split(buf_id, '<C-v>', 'belowright vertical')
                end,
            })
        end,
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.comment",
        version = false,
        opts = {
            options = {
                custom_commentstring = function()
                    return require('ts_context_commentstring').calculate_commentstring() or vim.bo.commentstring
                end,
            },
            mappings = {
                comment_line = "<C-/>",
                comment_visual = "<C-/>"
            }
        },
        event = "VeryLazy"
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
