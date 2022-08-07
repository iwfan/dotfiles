local db = require "dashboard"

db.custom_header = {
    "                                                                                  ",
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
    "                                                           version: " .. vim.fn.matchstr(
        vim.fn.execute "version",
        [[NVIM v\zs[^\n]*]]
    ) .. "",
    "                                                                                  ",
}

db.custom_center = {
    {
        icon = " ",
        desc = "Find Files                    ",
        action = "Telescope enhanced_find_files",
        shortcut = "SPC p",
    },
    {
        icon = " ",
        desc = "Live Grep                     ",
        action = "Telescope live_grep",
        shortcut = "SPC f",
    },
    {
        icon = " ",
        desc = "Git Status                    ",
        action = "Telescope git_status",
        shortcut = "SPC g",
    },
    {
        icon = " ",
        desc = "Bookmarks                     ",
        action = "Telescope marks",
        shortcut = "SPC m",
    },
    {
        icon = " ",
        desc = "Update Plugins                ",
        action = "PackerUpdate",
        shortcut = "     ",
    },
}
