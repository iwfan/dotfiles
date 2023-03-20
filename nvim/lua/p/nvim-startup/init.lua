require("dashboard").setup {
    theme = 'doom',
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
        center = {
            {
                icon = " ",
                icon_hl = '@property',
                desc = "Find File",
                desc_hl = 'String',
                action = "Telescope enhanced_find_files theme=ivy",
                key = "p",
                key_hl = 'Comment',
            },
            {
                icon = " ",
                icon_hl = '@property',
                desc = "Git Status",
                desc_hl = 'String',
                action = "Telescope git_status theme=ivy",
                key = "g",
                key_hl = 'Comment',
            },
            {
                icon = ' ',
                icon_hl = '@property',
                desc = 'Update',
                desc_hl = 'String',
                key = 'u',
                key_hl = 'Comment',
                action = 'Lazy update'
            },
            {
                icon = ' ',
                icon_hl = '@property',
                desc = 'Old Files',
                desc_hl = 'String',
                key = 'o',
                key_hl = 'Comment',
                action = 'Telescope oldfiles theme=ivy'
            },
            {
                icon = ' ',
                icon_hl = '@property',
                desc = 'Check Health',
                desc_hl = 'String',
                key = 'c',
                key_hl = 'Comment',
                action = 'checkhealth'
            },
        },
    }
}
