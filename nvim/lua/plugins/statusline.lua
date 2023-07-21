--        
return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
        return {
            options = {
                theme = "auto",
                component_separators = "|",
                section_separators = { left = "", right = "" },
                globalstatus = true,
                disabled_filetypes = { statusline = { "dashboard", "alpha" } },
            },
            sections = {
                lualine_a = {
                    { "mode", separator = { left = "" }, right_padding = 2 },
                },
                lualine_b = {
                    {
                        "branch",
                        icon = "󰘬",
                    },
                    "diff",
                    "diagnostics",
                },
                lualine_c = { "filename" },
                lualine_x = {},
                lualine_y = { "filetype", "encoding" },
                lualine_z = {
                    { "location", separator = { right = "" }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { "filename" },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { "location" },
            },
            tabline = {},
            extensions = {},
        }
    end,
}
