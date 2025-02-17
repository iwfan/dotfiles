return {
    {
        "echasnovski/mini.icons",
        lazy = true,
        opts = {
            file = {
                [".keep"] = { glyph = "󰊢", hl = "MiniIconsGrey" },
                ["devcontainer.json"] = { glyph = "", hl = "MiniIconsAzure" },
            },
            filetype = {
                dotenv = { glyph = "", hl = "MiniIconsYellow" },
            },
        },
        init = function()
            ---@diagnostic disable-next-line: duplicate-set-field
            package.preload["nvim-web-devicons"] = function()
                require("mini.icons").mock_nvim_web_devicons()
                return package.loaded["nvim-web-devicons"]
            end
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { 'echasnovski/mini.bufremove', version = false, opts = {} },
        event = "BufReadPost",
        opts = {
            options = {
                separator_style = "thin",
                modified_icon = "",
                show_close_icon = false,
                show_buffer_close_icons = false,
                offsets = {
                    {
                        filetype = "neo-tree",
                        text = "Neo-tree",
                        highlight = "Directory",
                        text_align = "left",
                    },
                    {
                        filetype = "snacks_layout_box",
                    },
                },
            },
            highlights = {
                separator = {
                    fg = '#343f44',
                    bg = '#343f44'
                },
                background = {
                    fg = '#859289',
                    bg = '#3d484d'
                },
                modified = {
                    bg = '#3d484d'
                },
                pick = {
                    bg = '#3d484d'
                },
                fill = {
                    bg = '#343f44'
                }
            },
        },
        keys = {
            {
                "[f",
                mode = { "n" },
                "<cmd>BufferLineCyclePrev<cr>",
                desc = "Prev Buffer",
            },
            {
                "]f",
                mode = { "n" },
                "<cmd>BufferLineCycleNext<cr>",
                desc = "Next Buffer",
            },
            {
                "[F",
                mode = { "n" },
                "<cmd>BufferLineMovePrev<cr>",
                desc = "Move Buffer Prev",
            },
            {
                "]F",
                mode = { "n" },
                "<cmd>BufferLineMoveNext<cr>",
                desc = "Move Buffer Next",
            },
            {
                "<bs>f",
                mode = { "n" },
                function ()
                    MiniBufremove.delete()
                end,
                desc = "Remove Buffer",
            },
            {
                "\\f",
                mode = { "n" },
                "<cmd>BufferLinePick<cr>",
                desc = "Show Buffer",
            },
            {
                "<space>1",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 1<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>2",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 2<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>3",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 3<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>4",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 4<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>5",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 5<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>6",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 6<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>7",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 7<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>8",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 8<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>9",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer 9<cr>",
                desc = "Go to buffer",
            },
            {
                "<space>0",
                mode = { "n" },
                "<cmd>BufferLineGoToBuffer -1<cr>",
                desc = "Go to buffer",
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                options = {
                    theme = "auto",
                    component_separators = "",
                    section_separators = "",
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = {
                            'startify',
                            'dashboard',
                            'packer',
                            'neogitstatus',
                            'Trouble',
                            'alpha',
                            'lir',
                            'Outline',
                            'spectre_panel',
                            'toggleterm',
                            'qf',
                        },
                        winbar = {},
                    },
                },
                sections = {
                    lualine_a = {
                        { 'mode', fmt = function(str) return str:sub(1, 1) end }
                    },
                    lualine_b = {
                        "diagnostics",
                    },
                    lualine_c = {
                        {
                            "filename",
                            path = 3,
                            file_status = false,
                            newfile_status = false,
                        },
                    },
                    lualine_x = {
                        "bo:filetype",
                        "location",
                    },
                    lualine_y = {
                        { 'b:gitsigns_head', icon = '󰘬' },
                    },
                    lualine_z = {},
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = { "filename" },
                    lualine_x = { "location" },
                    lualine_y = {},
                    lualine_z = {},
                },
                tabline = {},
                extensions = {},
            }
        end,
    },
}
