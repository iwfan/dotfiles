return {
    {
        "echasnovski/mini.starter",
        version = false,
        event = "VimEnter",
        opts = function()
            local starter = require "mini.starter"

            local lazy_footer = (function()
                local stats = require("lazy").stats()
                local ms = 0

                vim.api.nvim_create_autocmd("User", {
                    pattern = "LazyVimStarted",
                    callback = function()
                        stats = require("lazy").stats()
                        ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
                        MiniStarter.refresh()
                    end,
                })

                return function()
                    return "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
                end
            end)()

            return {
                header = vim.fn.system "fortune | cowsay",
                items = {
                    starter.sections.recent_files(5, true),
                    {
                        {
                            name = "Find File",
                            action = "Telescope enhanced_find_files theme=ivy",
                            section = "Actions",
                        },
                        {
                            name = "Update Plugins",
                            action = "Lazy update",
                            section = "Actions",
                        },
                        {
                            name = "Health Check",
                            action = "checkhealth",
                            section = "Actions",
                        },
                    },
                    starter.sections.sessions(3, true),
                },
                footer = lazy_footer,
                content_hooks = {
                    starter.gen_hook.adding_bullet(),
                    starter.gen_hook.aligning("center", "center"),
                },
            }
        end,
    },
    {
        "echasnovski/mini.statusline",
        version = false,
        opts = {
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
                    local git = MiniStatusline.section_git { trunc_width = 75 }
                    local diagnostics = MiniStatusline.section_diagnostics { trunc_width = 75 }
                    local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
                    local location = MiniStatusline.section_location { trunc_width = 99999999 }

                    return MiniStatusline.combine_groups {
                        { hl = mode_hl, strings = { mode } },
                        { hl = "MiniStatuslineFilename", strings = { git, diagnostics } },
                        "%<", -- Mark general truncate point
                        { hl = "MiniStatuslineDevinfo", strings = {} },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { location } },
                    }
                end,
                inactive = function()
                    local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
                    local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
                    local location = MiniStatusline.section_location { trunc_width = 99999999 }

                    return MiniStatusline.combine_groups {
                        { hl = mode_hl, strings = { mode } },
                        { hl = "MiniStatuslineFilename", strings = {} },
                        "%<", -- Mark general truncate point
                        { hl = "MiniStatuslineDevinfo", strings = {} },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { location } },
                    }
                end,
            },
            set_vim_settings = false,
        },
        event = "BufReadPost",
    },
    {
        "echasnovski/mini.tabline",
        version = false,
        event = "BufReadPost",
        opts = {
            show_icons = false,
            set_vim_settings = true,
            tabpage_section = "right",
        },
    },
    {
        "echasnovski/mini.bufremove",
        version = false,
        opts = {},
        keys = {
            {
                "<bs>f",
                mode = { "n", "x", "o" },
                function()
                    MiniBufremove.delete()
                end,
                desc = "Flash",
            },
        },
        event = "VeryLazy",
    },
    { "echasnovski/mini.indentscope", version = false, opts = {}, event = "VeryLazy" },
    {
        "echasnovski/mini.bracketed",
        version = false,
        opts = {
            buffer = { suffix = "f", options = {} },
            file = { suffix = "b", options = {} },
        },
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.move",
        version = false,
        opts = {},
        keys = {
            {
                "<M-j>",
                mode = { "i" },
                function()
                    MiniMove.move_line("down")
                end,
                desc = "Move line down",
            },
            {
                "<M-k>",
                mode = { "i" },
                function()
                    MiniMove.move_line("up")
                end,
                desc = "Move line down",
            },
            {
                "<M-h>",
                mode = { "i" },
                function()
                    MiniMove.move_line("left")
                end,
                desc = "Move line down",
            },
            {
                "<M-l>",
                mode = { "i" },
                function()
                    MiniMove.move_line("right")
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
                    c = treesitter { a = "@class.outer", i = "@class.inner" },
                    f = treesitter { a = "@function.outer", i = "@function.inner" },
                    k = treesitter { a = "@block.outer", i = "@block.inner" },
                    o = treesitter {
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
    {
        "echasnovski/mini.files",
        version = false,
        opts = {},
        keys = {
            {
                "<space>t",
                mode = { "n" },
                function()
                    MiniFiles.open()
                end,
                desc = "Flash",
            },
        },
        event = "VeryLazy",
    },
    { "echasnovski/mini.sessions", version = false, opts = { autoread = false, autowrite = true } },
}
