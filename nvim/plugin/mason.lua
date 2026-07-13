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
        "basedpyright",
        "css-lsp",
        "gopls",
        "html-lsp",
        "lua-language-server",
        "marksman",
        "ruff",
        "tailwindcss-language-server",
        "typos",
        "vtsls",
        "vue-language-server",
    },
}
