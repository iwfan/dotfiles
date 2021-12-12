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
vim.g.dashboard_session_directory = vim.fn.stdpath "data" .. "/sessions/"

vim.g.dashboard_custom_section = {
    a = { description = { "  Load Last Session         SPC l" }, command = "Prosession ." },
    b = { description = { "洛 New File                  SPC n" }, command = "DashboardNewFile" },
    c = { description = { "  Find File                 SPC o" }, command = "Telescope find_files" },
    d = { description = { "  Git Status                SPC g" }, command = "Telescope git_status" },
    e = { description = { "  Recents                   SPC o" }, command = "Telescope oldfiles" },
    f = { description = { "  Find Word                 SPC f" }, command = "Telescope live_grep" },
    g = { description = { "  Bookmarks                 SPC m" }, command = "Telescope marks" },
}
