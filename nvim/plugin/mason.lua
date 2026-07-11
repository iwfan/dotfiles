require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
    ensure_installed = {
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "vtsls",
        "lua-language-server",
        "gopls",
        "basedpyright",
    },
}
