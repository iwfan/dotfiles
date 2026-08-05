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
        [[                                                                      ]],
    }

    return table.concat(lines, "\n")
end

return {
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
            indent = { enabled = true, animate = { enabled = false }, scope = { enabled = false } },
            input = { enabled = true },
            notifier = { enabled = true, timeout = 3000 },
            picker = { enabled = true },
            quickfile = { enabled = true },
            scope = { enabled = false },
            scroll = { enabled = false },
            statuscolumn = { enabled = false },
            words = { enabled = false },
            lazygit = {
                configure = false,
                win = {
                    backdrop = false,
                    width = 0,
                    height = 0,
                    wo = {
                        winhighlight = "Normal:Normal,NormalNC:Normal,NormalFloat:Normal",
                    },
                },
            },
            styles = {
                lazygit = {
                    wo = {
                        winhighlight = "Normal:Normal,NormalNC:Normal,NormalFloat:Normal",
                    },
                },
            },
        },
        keys = {
            {
                "<C-\\>",
                function()
                    Snacks.picker.resume()
                end,
                desc = "Resume picker",
            },
            {
                "<C-f>",
                function()
                    Snacks.picker.grep()
                end,
                desc = "Grep",
            },
            {
                "<C-p>",
                function()
                    Snacks.picker.smart()
                end,
                desc = "Search File",
            },
            {
                "<C-g>",
                function()
                    Snacks.lazygit.open()
                end,
                desc = "Open Lazygit",
            },
            {
                "<C-w>b",
                function()
                    Snacks.terminal.toggle()
                end,
                desc = "Open Terminal",
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
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            preset = "helix",
            defaults = {},
            spec = {
                {
                    {
                        "<leader>b",
                        group = "buffer",
                        expand = function()
                            return require("which-key.extras").expand.buf()
                        end,
                    },
                    {
                        "<leader>w",
                        group = "windows",
                        proxy = "<c-w>",
                        expand = function()
                            return require("which-key.extras").expand.win()
                        end,
                    },
                    -- better descriptions
                    { "gx", desc = "Open with system app" },
                },
            },
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show { global = false }
                end,
                desc = "Buffer Keymaps (which-key)",
            },
            {
                "<c-w><space>",
                function()
                    require("which-key").show { keys = "<c-w>", loop = true }
                end,
                desc = "Window Hydra Mode (which-key)",
            },
        },
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        vscode = true,
        opts = {},
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
          -- Simulate nvim-treesitter incremental selection
          { "<CR>", mode = { "n", "o", "x" },
            function()
              require("flash").treesitter({
                actions = {
                  ["<CR>"] = "next",
                  ["<BS>"] = "prev"
                }
              })
            end, desc = "Treesitter Incremental Selection" },
        },
    },
    {
        "nvim-lualine/lualine.nvim",
        event = "VeryLazy",
        init = function()
            if vim.fn.argc(-1) > 0 then
                vim.o.statusline = " "
            else
                vim.o.laststatus = 0
                vim.o.showtabline = 0
            end
        end,
        config = function(_, opts)
            require("lualine").setup(opts)
            local function update_tabline()
                vim.o.showtabline = vim.bo.filetype == "snacks_dashboard" and 0 or 2
            end
            update_tabline()
            vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, { callback = update_tabline })
        end,
        opts = {
            options = {
                icons_enabled = false,
                component_separators = { left = "", right = "" },
                -- section_separators = { left = "", right = "" },
                globalstatus = vim.o.laststatus == 3,
                -- always_show_tabline = false,
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
                        "ministarter",
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
                            separator = "",
                        },
                        ignore_lsp = {},
                        show_name = false,
                    },
                    "filesize",
                },
                lualine_y = {
                    "location",
                },
                lualine_z = {},
            },
            tabline = {
                lualine_a = {},
                lualine_b = {
                    {
                        "buffers",
                        buffers_color = {
                            active = "lualine_a_normal",
                            inactive = "lualine_a_inactive",
                        },
                    },
                },
                lualine_c = {},
                lualine_x = {},
                lualine_y = {
                    {
                        "tabs",
                        tabs_color = {
                            active = "lualine_a_normal",
                            inactive = "lualine_a_inactive",
                        },
                    },
                },
                lualine_z = {},
            },
            extensions = {},
        },
    },
    {
        "mikavilpas/yazi.nvim",
        version = "*", -- use the latest stable version
        event = "VeryLazy",
        dependencies = {
            { "nvim-lua/plenary.nvim", lazy = true },
        },
        keys = {
            -- 👇 in this section, choose your own keymappings!
            {
                "<C-t>",
                mode = { "n", "v" },
                "<cmd>Yazi<cr>",
                desc = "Open yazi at the current file",
            },
            {
                -- Open in the current working directory
                "<leader>-",
                "<cmd>Yazi cwd<cr>",
                desc = "Open the file manager in nvim's working directory",
            },
        },
        ---@type YaziConfig | {}
        opts = {
            -- if you want to open yazi instead of netrw, see below for more info
            open_for_directories = false,
            floating_window_scaling_factor = 1,
            yazi_floating_window_border = "none",
            keymaps = {
                show_help = "<f1>",
            },
        },
        -- 👇 if you use `open_for_directories=true`, this is recommended
        init = function()
            -- mark netrw as loaded so it's not loaded at all.
            --
            -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
            vim.g.loaded_netrwPlugin = 1
        end,
    },
}
