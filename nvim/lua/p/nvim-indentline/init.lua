require("indent_blankline").setup {
    filetype = {
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
        "css",
        "scss",
        "sass",
        "lua",
        "go",
        "rust",
        "json",
        "yaml",
        "toml",
    },
    buftype_exclude = { "terminal", "telescope" },
}
