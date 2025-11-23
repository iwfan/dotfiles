return {
    {
        "echasnovski/mini.icons",
        priority = 1000,
        lazy = false,
        opts = {},
        init = function()
            -- @diagnostic disable-next-line: duplicate-set-field
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "folke/snacks.nvim",
        priority = 1000,
        lazy = false,
        opts = {
            bigfile = { enabled = true },
            dashboard = { enabled = false },
            explorer = { enabled = false },
            indent = {
                enabled = true,
                animate = {
                    enabled = false,
                },
                scope = {
                    enabled = false,
                },
            },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
        },
        keys = {
            {
                "<leader>b",
                function()
                    Snacks.picker.buffers()
                end,
                desc = "Buffers",
            },
            {
                "<leader>/",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep",
            },
            {
                "<leader>p",
                function()
                    Snacks.picker.smart()
                end,
                desc = "Search File",
            },
        },
    },
    {
        "echasnovski/mini.statusline",
        version = false,
        opts = {
            content = {
                active = function()
                    local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
                    local git = MiniStatusline.section_git { trunc_width = 40 }
                    local lsp = MiniStatusline.section_lsp({ trunc_width = 75 })
                    local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
                    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

                    return MiniStatusline.combine_groups {
                        { hl = mode_hl, strings = { mode } },
                        { hl = "MiniStatuslineDevinfo", strings = { git } },
                        "%<", -- Mark general truncate point
                        { hl = "MiniStatuslineFilename", strings = { lsp } },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { row .. ':' .. col } },
                    }
                end,
                inactive = function()
                    local mode, mode_hl = MiniStatusline.section_mode { trunc_width = 120 }
                    local filename = MiniStatusline.section_filename({ trunc_width = 140 })
                    local fileinfo = MiniStatusline.section_fileinfo { trunc_width = 120 }
                    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

                    return MiniStatusline.combine_groups {
                        { hl = mode_hl, strings = { mode } },
                        { hl = "MiniStatuslineFilename", strings = { filename } },
                        "%<", -- Mark general truncate point
                        { hl = "MiniStatuslineDevinfo", strings = {} },
                        "%=", -- End left alignment
                        { hl = "MiniStatuslineFileinfo", strings = { fileinfo } },
                        { hl = mode_hl, strings = { row .. ':' .. col } },
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
                "<leader>x",
                function()
                    MiniBufremove.delete()
                end,
                desc = "Close other buffers",
            },
        },
        event = "VeryLazy",
    },
    {
        "echasnovski/mini.files",
        version = false,
        opts = {},
        keys = {
            {
                "<space>e",
                mode = { "n" },
                function()
                    MiniFiles.open()
                end,
                desc = "Flash",
            },
        },
        event = "VeryLazy",
    },
    {
        "sainnhe/everforest",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_background = "hard"
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme "everforest"
        end,
    },
}
