require("mason").setup {
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
    ensure_installed = {
        "astro-language-server",
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "vtsls",
        "vue-language-server",
        "lua-language-server",
        "gopls",
        "basedpyright",
    },
}
