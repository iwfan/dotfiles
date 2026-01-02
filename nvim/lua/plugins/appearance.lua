local function get_header()
    local lines = {
        [[                                                                    ]],
        [[      ███████████           █████      ██                     ]],
        [[     ███████████             █████                             ]],
        [[     ████████████████ ███████████ ███   ███████     ]],
        [[    ████████████████ ████████████ █████ ██████████████   ]],
        [[   ██████████████    █████████████ █████ █████ ████ █████   ]],
        [[ ██████████████████████████████████ █████ █████ ████ █████  ]],
        [[██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
    }

    local cowsays = {
        [[┌──────────────────────────┐      ]],
        [[│    Powered By  eovim   │      ]],
        [[└──────────────────────────┘      ]],
        [[             \   ^__^             ]],
        [[              \  (oo)\_______     ]],
        [[                 (__)\       )\/\ ]],
        [[                     ||----w |    ]],
        [[                     ||     ||    ]],
        [[                                  ]],
    }

    return table.concat(cowsays, "\n")
end

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
            dashboard = {
                enabled = true,
                width = 40,
                preset = {
                    keys = {
                        {
                            icon = "󰱽 ",
                            key = "o",
                            desc = "Recent Files",
                            action = ":lua Snacks.dashboard.pick('oldfiles')",
                        },
                        { icon = "󰁯 ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        {
                            icon = "󰒲 ",
                            key = "u",
                            desc = "Lazy",
                            action = ":Lazy sync",
                            enabled = package.loaded.lazy ~= nil,
                        },
                        { icon = " ", key = "m", desc = "Mason", action = ":Mason" },
                    },
                    header = get_header(),
                },
                sections = {
                    { section = "header" },
                    { section = "keys", gap = 1, padding = 1 },
                },
            },
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
            {
                "<leader>x",
                function()
                    Snacks.bufdelete.delete()
                end,
                desc = "Delete buffer",
            },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        opts = function()
            return {
                options = {
                    icons_enabled = false,
                    component_separators = "",
                    section_separators = "",
                    globalstatus = true,
                    disabled_filetypes = {
                        statusline = {
                            "startify",
                            "dashboard",
                            "packer",
                            "neogitstatus",
                            "Trouble",
                            "alpha",
                            "lir",
                            "Outline",
                            "spectre_panel",
                            "toggleterm",
                            "qf",
                            "snacks_dashboard",
                        },
                        tabline = {
                            "snacks_picker_input",
                            "snacks_dashboard",
                        },
                    },
                },
                sections = {
                    lualine_a = {
                        {
                            "mode",
                            fmt = function(str)
                                return str:sub(1, 1)
                            end,
                        },
                    },
                    lualine_b = {
                        { "b:gitsigns_head", icon = "󰘬" },
                        "diagnostics",
                    },
                    lualine_c = {
                        { "filename", path = 4 },
                    },
                    lualine_x = {
                        "encoding",
                        "filetype",
                        {
                            "lsp_status",
                            icon = "",
                            symbols = {
                                spinner = { "󰪞 ", "󰪟 ", "󰪠 ", "󰪡 ", "󰪢 ", "󰪣 ", "󰪤 ", "󰪥 " },
                                done = "󰄴 ",
                                -- Delimiter inserted between LSP names:
                                separator = "",
                            },
                            -- List of LSP names to ignore (e.g., `null-ls`):
                            ignore_lsp = {},
                            -- Display the LSP name
                            show_name = false,
                        },
                        "filesize",
                    },
                    lualine_y = {
                        "location",
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
                tabline = {
                    lualine_a = {},
                    lualine_b = {
                        {
                            "buffers",
                            buffers_color = {
                                -- Same values as the general color option can be used here.
                                active = "lualine_a_normal", -- Color for active buffer.
                                inactive = "lualine_a_inactive", -- Color for inactive buffer.
                            },
                        },
                    },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {
                        {
                            "tabs",
                            tabs_color = {
                                -- Same values as the general color option can be used here.
                                active = "lualine_a_normal", -- Color for active tab.
                                inactive = "lualine_a_inactive", -- Color for inactive tab.
                            },
                        },
                    },
                    lualine_z = {},
                },
                extensions = {},
            }
        end,
    },
    {
        "sainnhe/everforest",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.everforest_background = "hard"
            vim.g.everforest_better_performance = 1
            -- vim.cmd.colorscheme "everforest"
        end,
    },
    {
        "webhooked/kanso.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
        config = function()
            require("kanso").setup {
                italics = true, -- enable italics
                commentStyle = { italic = true },
                keywordStyle = { italic = false },
                colors = { -- add/modify theme and palette colors
                    palette = {
                        -- Mist Bg Shades
                        mistBg0 = "#282c34",
                        mistBg1 = "#262626",
                        mistBg2 = "#3a3a3a",
                        mistBg3 = "#666666",
                    },
                },
                background = "mist",
                foreground = "saturated", -- "default" or "saturated" (can also be a table like background)
            }

            -- setup must be called before loading
            vim.cmd "colorscheme kanso-mist"
        end,
    },
}
