return {
    -- Conform: Formatting
    {
        "stevearc/conform.nvim",
        event = { "BufWritePre", "BufNewFile" },
        cmd = { "ConformInfo" },
        keys = {
            {
                "<leader>f",
                function()
                    require("conform").format { async = true, lsp_format = "fallback" }
                end,
                desc = "[F]ormat buffer",
            },
        },
        opts = {
            notify_on_error = false,
            formatters_by_ft = {
                lua = { "stylua" },
                go = { "goimports", "gofmt" },
                python = { "ruff_format" },
                astro = { "biome" },
                javascript = { "biome" },
                typescript = { "biome" },
                javascriptreact = { "biome" },
                typescriptreact = { "biome" },
                ["_"] = { "trim_whitespace" },
            },
        },
    },
}
