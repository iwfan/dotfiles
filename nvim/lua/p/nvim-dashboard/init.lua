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
    s = {
        description = { "  Reload Last Session            SPC s" },
        command = "CocCommand session.load",
    },
    o = {
        description = { "  Recently Opened Files          SPC o" },
        command = "CocList mru",
    },
    g = {
        description = { "  Git Status                     SPC g" },
        command = "CocList gstatus",
    },
    f = {
        description = { "  Find File                      SPC p" },
        command = "CocList files",
    },
}

vim.g.dashboard_custom_footer = { "" }
