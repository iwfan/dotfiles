vim.g.dashboard_custom_header = {
    "                    ",
    "                    ",
    "       ▄▄        ▄▄ ",
    "     ▄████       ███▄                                            ▄▄ ",
    "   ▄ ▀█████▄     █████                                           ▀▀ ",
    "   ▌ ▀▄██████    █████     ▌ ▄▀▀▄▄   ▄▄▀▀ ▄    ▄ ▀▀▄▄ ▓█▄    ▄█▌▐██ ▐██▄███▄▄▓███▄ ",
    "   ▌    ▀█████▄  █████     ▌     ▐  ▓      █ ▄▀     ▐▌ ██▄  ▄█▌ ▐██ ▐██   ▐██   ▓██ ",
    "   ▌   ▐  ██████ █████     ▌     ▐▌ █▀▀▀▀▀▀▀ █       █  ██ ▐██  ▐██ ▐██   ▐██   ▐██ ",
    "   ▌   ▐   ▀█████▄████     ▌     ▐▌ █        ▀▄      █   ████   ▐██ ▐██   ▐██   ▐██ ",
    "   ▌   ▐    ▀█████▄▀██     ▌     ▐   ▀▀▄▄▄▀▀   ▀▄▄▄▀▀    ▐▀▀    ▐▀▀ ▐▀▀   ▐▀▀   ▐▀▀ ",
    "   ▀   ▐      ▀█████ █ ",
    "     ▀▄▐       ▀████ ",
    "       ▀         ▀ ",
    "",
    "                                                             version: " .. vim.fn.matchstr(
        vim.fn.execute "version",
        [[NVIM v\zs[^\n]*]]
    ) .. "",
}

vim.g.dashboard_default_executive = "telescope"

vim.g.dashboard_custom_section = {
    a = {
        description = { "  Recently Opened Files" },
        command = "Telescope oldfiles",
    },
    b = {
        description = { "  Git Status           " },
        command = "Telescope git_status",
    },
    c = {
        description = { "  Find File            " },
        command = "Telescope find_files",
    },
    d = {
        description = { "  Reload Last Session  " },
        command = "CocCommand session.load",
    },
}

vim.g.dashboard_custom_footer = { "" }
