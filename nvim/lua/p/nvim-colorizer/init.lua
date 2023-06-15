require("colorizer").setup {
    filetypes = {
        "*",
        css = { css = true },
        less = { css = true },
        scss = { css = true },
        sass = { css = true },
        vue = { css = true },
        html = {
            css = true,
            mode = "foreground",
        },
        -- exclude prompt and popup buftypes from highlight
        "!prompt",
        "!popup",
    },
}
