local startup_custom_header = {
    "                                                                                  ",
    "     ▄▄        ▄▄                                                                 ",
    "   ▄████       ███▄                                            ▄▄                 ",
    " ▄ ▀█████▄     █████                                           ▀▀                 ",
    " ▌ ▀▄██████    █████     ▌ ▄▀▀▄▄   ▄▄▀▀ ▄    ▄ ▀▀▄▄ ▓█▄    ▄█▌▐██ ▐██▄███▄▄▓███▄  ",
    " ▌    ▀█████▄  █████     ▌     ▐  ▓      █ ▄▀     ▐▌ ██▄  ▄█▌ ▐██ ▐██   ▐██   ▓██ ",
    " ▌   ▐  ██████ █████     ▌     ▐▌ █▀▀▀▀▀▀▀ █       █  ██ ▐██  ▐██ ▐██   ▐██   ▐██ ",
    " ▌   ▐   ▀█████▄████     ▌     ▐▌ █        ▀▄      █   ████   ▐██ ▐██   ▐██   ▐██ ",
    " ▌   ▐    ▀█████▄▀██     ▌     ▐   ▀▀▄▄▄▀▀   ▀▄▄▄▀▀    ▐▀▀    ▐▀▀ ▐▀▀   ▐▀▀   ▐▀▀ ",
    " ▀   ▐      ▀█████ █                                                              ",
    "   ▀▄▐       ▀████                                                                ",
    "     ▀         ▀                                                                  ",
    "                                                                                  ",
    "                                                           version: " .. vim.fn.matchstr(
        vim.fn.execute "version",
        [[NVIM v\zs[^\n]*]]
    ) .. "",
}

local settings = {
    header = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Header",
        margin = 5,
        content = startup_custom_header,
        highlight = "Operator",
        default_color = "",
        oldfiles_amount = 0,
    },
    body = {
        type = "mapping",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Basic Commands",
        margin = 5,
        content = {
            { "  Recent Files", "Telescope oldfiles theme=ivy", "SPC ?" },
            { "  Git Status", "Telescope git_status theme=ivy", "SPC ?" },
            { "  Find File", "Telescope find_files theme=ivy", "SPC p" },
            { "  Find Word", "Telescope live_grep theme=ivy", "SPC f" },
            { "  Bookmarks", "Telescope marks theme=ivy", "SPC m" },
        },
        highlight = "String",
        default_color = "",
        oldfiles_amount = 0,
    },
    footer = {
        type = "text",
        oldfiles_directory = false,
        align = "center",
        fold_section = false,
        title = "Footer",
        margin = 5,
        content = { "Touching fish makes working more efficient." },
        highlight = "Comment",
        default_color = "",
        oldfiles_amount = 0,
    },

    options = {
        mapping_keys = true,
        cursor_column = 0.5,
        empty_lines_between_mappings = true,
        disable_statuslines = true,
        paddings = { 1, 3, 3, 0 },
    },
    mappings = {
        execute_command = "<CR>",
        open_file = "o",
        open_file_split = "<c-o>",
        open_section = "<TAB>",
        open_help = "?",
    },
    parts = { "header", "body", "footer" },
}

require("startup").setup(settings)
