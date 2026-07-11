require("conform").setup {
    notify_on_error = false,
    formatters_by_ft = {
        lua = { "stylua" },
        go = { "goimports", "gofmt" },
        python = { "ruff_format" },
        javascript = { "biome" },
        typescript = { "biome" },
        javascriptreact = { "biome" },
        typescriptreact = { "biome" },
        ["_"] = { "trim_whitespace" },
    },
}

vim.keymap.set("", "<leader>f", function()
    require("conform").format { async = true, lsp_format = "fallback" }
end, { desc = "[F]ormat buffer" })
