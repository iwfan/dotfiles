return {
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
                        'neo-tree',
                        'packer',
                        'neogitstatus',
                        'NvimTree',
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
}
