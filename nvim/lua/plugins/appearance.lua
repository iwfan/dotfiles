return {
    {
        "sainnhe/everforest",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_background = "medium"
            vim.g.everforest_better_performance = 1
            vim.cmd.colorscheme "everforest"
        end,
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        dependencies = { "nvim-tree/nvim-web-devicons", { 'echasnovski/mini.bufremove', version = false, opts = {} } },
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
                        text = "File Explorer",
                        text_align = "left",
                        highlight = "Directory",
                    }
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
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        opts = {
            sources = { "filesystem", "buffers", "git_status", "document_symbols" },
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            window = {
                mappings = {
                    ["l"] = "open",
                    ["h"] = "close_node",
                    ["<space>"] = "none",
                    ["Y"] = {
                        function(state)
                            local node = state.tree:get_node()
                            local path = node:get_id()
                            vim.fn.setreg("+", path, "c")
                        end,
                        desc = "Copy Path to Clipboard",
                    },
                    ["O"] = {
                        function(state)
                            require("lazy.util").open(state.tree:get_node().path, { system = true })
                        end,
                        desc = "Open with System Application",
                    },
                },
            },
            default_component_configs = {
                indent = {
                    with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                git_status = {
                    symbols = {
                        unstaged = "󰄱",
                        staged = "󰱒",
                    },
                },
            },
        },
        keys = {
            {
                "<space>e",
                mode = { "n" },
                "<cmd>Neotree toggle<cr>",
                desc = "Show File Explorer",
            },
        }
    }
}
