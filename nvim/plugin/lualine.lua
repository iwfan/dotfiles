-- ============================================================================
-- lualine.nvim — blazing fast statusline
-- ============================================================================

vim.api.nvim_create_autocmd("VimEnter", {
    once = true,
    callback = function()
        require("lualine").setup {
            options = {
                icons_enabled = false,
                component_separators = { left = "", right = "" },
                section_separators = { left = "", right = "" },
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
        }
    end,
})
