--             val = {
--                 [[                                                                    ]],
--                 [[      ███████████           █████      ██                     ]],
--                 [[     ███████████             █████                             ]],
--                 [[     ████████████████ ███████████ ███   ███████     ]],
--                 [[    ████████████████ ████████████ █████ ██████████████   ]],
--                 [[   ██████████████    █████████████ █████ █████ ████ █████   ]],
--                 [[ ██████████████████████████████████ █████ █████ ████ █████  ]],
--                 [[██████  ███ █████████████████ ████ █████ █████ ████ ██████ ]],
--             },

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
                width = 70,
                preset = {
                    keys = {
                        { icon = " ", key = "o", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
                        { icon = " ", key = "p", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
                        { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
                        { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
                        { icon = " ", key = "s", desc = "Restore Session", section = "session" },
                        { icon = " ", key = "q", desc = "Quit", action = ":qa" },
                    },
                },
                sections = {
                    {
                        section = "terminal",
                        cmd = [[
                    echo '
                                             
      ███████████           █████      ██
     ███████████             █████ 
     ████████████████ ███████████ ███   ███████
    ████████████████ ████████████ █████ ██████████████
   ██████████████    █████████████ █████ █████ ████ █████
 ██████████████████████████████████ █████ █████ ████ █████
██████  ███ █████████████████ ████ █████ █████ ████ ██████' | lolcat
                    ]],
                        height = 10,
                        padding = 1,
                    },
                    { section = "keys", gap = 1, padding = 1 },
                    { section = "startup" },
                },
            },
            explorer = { enabled = true },
            indent = { enabled = true },
            input = { enabled = true },
            notifier = {
                enabled = true,
                timeout = 3000,
            },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = true },
            scroll = { enabled = true },
            statuscolumn = { enabled = true },
            words = { enabled = true },
            styles = {
                notification = {
                    -- wo = { wrap = true } -- Wrap notifications
                },
            },
        },
        keys = {
            { "<leader><space>", function() Snacks.picker.smart() end,            desc = "Smart Find Files", },
            { "<leader>,",       function() Snacks.picker.buffers() end,          desc = "Buffers", },
            { "<leader>/",       function() Snacks.picker.grep() end,             desc = "Grep", },
            { "<leader>:",       function() Snacks.picker.command_history() end,  desc = "Command History", },
            { "<leader>n",       function() Snacks.picker.notifications() end,    desc = "Notification History", },
            { "<leader>e",       function() Snacks.explorer() end,                desc = "File Explorer", },
            { "<leader>p",       function() Snacks.picker.files() end,            desc = "Search File", },
            { "<leader>o",       function() Snacks.picker.recent() end,           desc = "Search OldFiles", },
            { "]w",              function() Snacks.words.jump(vim.v.count1) end,  desc = "Next Reference",       mode = { "n", "t" } },
            { "[w",              function() Snacks.words.jump(-vim.v.count1) end, desc = "Prev Reference",       mode = { "n", "t" } },
        },
    },
    {
        "akinsho/bufferline.nvim",
        version = "*",
        event = "BufReadPost",
        opts = {
            options = {
                separator_style = "thin",
                modified_icon = "",
                show_close_icon = false,
                show_buffer_close_icons = false,
                offsets = {
                    {
                        filetype = "snacks_picker_list",
                        text = "Files",
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
                    fg = "#343f44",
                    bg = "#343f44",
                },
                background = {
                    fg = "#859289",
                    bg = "#3d484d",
                },
                modified = {
                    bg = "#3d484d",
                },
                pick = {
                    bg = "#3d484d",
                },
                fill = {
                    bg = "#343f44",
                },
            },
        },
        keys = {
            { "[f",       mode = { "n" }, "<cmd>BufferLineCyclePrev<cr>",     desc = "Prev Buffer", },
            { "]f",       mode = { "n" }, "<cmd>BufferLineCycleNext<cr>",     desc = "Next Buffer", },
            { "[F",       mode = { "n" }, "<cmd>BufferLineMovePrev<cr>",      desc = "Move Buffer Prev", },
            { "]F",       mode = { "n" }, "<cmd>BufferLineMoveNext<cr>",      desc = "Move Buffer Next", },
            { "<bs>f",    mode = { "n" }, function() Snacks.bufdelete() end,  desc = "Remove Buffer", },
            { "\\f",      mode = { "n" }, "<cmd>BufferLinePick<cr>",          desc = "Show Buffer", },
            { "<space>1", mode = { "n" }, "<cmd>BufferLineGoToBuffer 1<cr>",  desc = "Go to buffer", },
            { "<space>2", mode = { "n" }, "<cmd>BufferLineGoToBuffer 2<cr>",  desc = "Go to buffer", },
            { "<space>3", mode = { "n" }, "<cmd>BufferLineGoToBuffer 3<cr>",  desc = "Go to buffer", },
            { "<space>4", mode = { "n" }, "<cmd>BufferLineGoToBuffer 4<cr>",  desc = "Go to buffer", },
            { "<space>5", mode = { "n" }, "<cmd>BufferLineGoToBuffer 5<cr>",  desc = "Go to buffer", },
            { "<space>6", mode = { "n" }, "<cmd>BufferLineGoToBuffer 6<cr>",  desc = "Go to buffer", },
            { "<space>7", mode = { "n" }, "<cmd>BufferLineGoToBuffer 7<cr>",  desc = "Go to buffer", },
            { "<space>8", mode = { "n" }, "<cmd>BufferLineGoToBuffer 8<cr>",  desc = "Go to buffer", },
            { "<space>9", mode = { "n" }, "<cmd>BufferLineGoToBuffer 9<cr>",  desc = "Go to buffer", },
            { "<space>0", mode = { "n" }, "<cmd>BufferLineGoToBuffer -1<cr>", desc = "Go to buffer", },
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
                        { "b:gitsigns_head", icon = "󰘬" },
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
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {},
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },

    }
}
