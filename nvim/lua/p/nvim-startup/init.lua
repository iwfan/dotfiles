require("dashboard").setup {
    theme = "hyper",
    config = {
        header = {
            "                                                                                  ",
            "                                                                                  ",
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
            "                                                           version: "
                .. vim.fn.matchstr(vim.fn.execute "version", [[NVIM v\zs[^\n]*]])
                .. "",
            "                                                                                  ",
        },
        shortcut = {
            { desc = " Update", group = "@property", action = "Lazy update", key = "u" },
            {
                desc = " Files",
                group = "String",
                action = "Telescope enhanced_find_files",
                key = "p",
            },
            {
                desc = " Git Status",
                group = "Label",
                action = "Telescope git_status",
                key = "g",
            },
        },
        project = { action = "Telescope enhanced_find_files cwd=" },
    },
}
