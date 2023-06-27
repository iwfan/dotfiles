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
                header = nil,
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
    { "echasnovski/mini.align", version = false, opts = {}, event = "VeryLazy" },
    { "echasnovski/mini.ai", version = false, opts = {}, event = "VeryLazy" },
    { "echasnovski/mini.sessions", version = false, opts = { autoread = true, autowrite = true } },
}
