require("lualine").setup {
    options = {
        theme = "auto",
        component_separators = "|",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { "dashboard" },
    },
    sections = {
        lualine_a = {
            { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { { "branch", icon = "" }, "diff", "diagnostics" },
        lualine_c = {},
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
    tabline = {
        lualine_a = {
            {
                "buffers",
                show_filename_only = true, -- Shows shortened relative path when set to false.
                hide_filename_extension = false, -- Hide filename extension when set to true.
                show_modified_status = true, -- Shows indicator when the buffer is modified.

                mode = 0, -- 0: Shows buffer name
                -- 1: Shows buffer index
                -- 2: Shows buffer name + buffer index
                -- 3: Shows buffer number
                -- 4: Shows buffer name + buffer number

                max_length = vim.o.columns * 2 / 3, -- Maximum width of buffers component,
                -- it can also be a function that returns
                -- the value of `max_length` dynamically.
                filetype_names = {
                    TelescopePrompt = "Telescope",
                    dashboard = "Dashboard",
                    packer = "Packer",
                    fzf = "FZF",
                    alpha = "Alpha",
                }, -- Shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )

                -- Automatically updates active buffer color to match color of other components (will be overidden if buffers_color is set)
                use_mode_colors = true,

                symbols = {
                    modified = " ●", -- Text to show when the buffer is modified
                    alternate_file = "#", -- Text to show to identify the alternate file
                    directory = "", -- Text to show when the buffer is a directory
                },
            },
        },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
    },
    winbar = {},
    inactive_winbar = {},
    extensions = {},
}

vim.keymap.set("n", "[f", "<cmd>bp<cr>")
vim.keymap.set("n", "]f", "<cmd>bn<cr>")
vim.keymap.set("n", "<bs>f", "<cmd>Bdelete!<cr>")
