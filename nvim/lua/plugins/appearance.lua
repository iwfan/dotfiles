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
    {
        "sainnhe/gruvbox-material",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_better_performance = 1
            -- vim.cmd.colorscheme "gruvbox-material"
        end,
    },
    {
        "sainnhe/sonokai",
        version = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_better_performance = 1
            -- vim.cmd.colorscheme "sonokai"
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
                        { icon = "󰱽 ", key = "o", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = "󰁯 ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = "󰒲 ", key = "u", desc = "Lazy", action = ":Lazy sync", enabled = package.loaded.lazy ~= nil },
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
                    enabled = false
                },
                scope = {
                    enabled = false
                }
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
            { "<leader><space>", function() Snacks.picker.smart() end,            desc = "Smart Find Files" },
            { "<leader>b",       function() Snacks.picker.buffers() end,          desc = "Buffers", },
            { "<leader>/",       function() Snacks.picker.grep() end,             desc = "Grep", },
            { "<leader>p",       function() Snacks.picker.files() end,            desc = "Search File", },
            { "<leader>o",       function() Snacks.picker.recent() end,           desc = "Search OldFiles", },
            { "<leader>E",       function() Snacks.explorer() end,                desc = "File Explorer" },
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
                        },
                        winbar = {},
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
                        {
                            "filename",
                            path = 3,
                            file_status = false,
                            newfile_status = false,
                        },
                    },
                    lualine_x = {
                        "bo:filetype",
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
                tabline = {},
                extensions = {},
            }
        end,
    },
}
