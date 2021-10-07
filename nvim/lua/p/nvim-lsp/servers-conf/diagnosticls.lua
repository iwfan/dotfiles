return function(default_opts)
    default_opts.filetypes = {
        "html",
        "jade",
        "markdown",
        "mdx",
        "mustache",
        "vue",
        "svelte",
        "css",
        "less",
        "scss",
        "styls",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "json",
        "yaml",
        "toml",
        "lua",
        "go",
    }

    default_opts.init_options = {
        linters = {
            eslint = {
                sourceName = "eslint",
                command = "eslint_d",
                rootPatterns = { ".eslintrc.js", "package.json" },
                debounce = 100,
                args = {
                    "--stdin",
                    "--stdin-filename",
                    "%filepath",
                    "--format",
                    "json",
                },
                parseJson = {
                    errorsRoot = "[0].messages",
                    line = "line",
                    column = "column",
                    endLine = "endLine",
                    endColumn = "endColumn",
                    message = "${message} [${ruleId}]",
                    security = "severity",
                },
                securities = { [2] = "error", [1] = "warning" },
            },
            golint = {
                sourceName = "golangci-lint",
                command = "golangci-lint",
                rootPatterns = { ".git", "go.mod" },
                debounce = 100,
                args = { "run", "--out-format", "json", "%filepath" },
                parseJson = {
                    errorsRoot = "Issues",
                    line = "Pos.Line",
                    column = "Pos.Column",
                    message = "${Text} (${FromLinter})",
                },
            },
        },
        filetypes = {
            javascript = { "eslint" },
            javascriptreact = { "eslint" },
            ["javascript.jsx"] = { "eslint" },
            typescript = { "eslint" },
            typescriptreact = { "eslint" },
            ["typescript.tsx"] = { "eslint" },
            go = { "golint" },
        },
        formatters = {
            prettier = {
                command = "prettier",
                args = { "--stdin-filepath", "%filepath" },
            },
            luafmt = {
                command = "luafmt",
                args = { "--indent-count", "2", "--stdin", "%filepath" },
            },
            gofmt = {
                command = "gofmt",
                args = { "-r", "'(a) -> a'", "-l", "%filepath" },
            },
        },
        formatFiletypes = {
            javascript = { "prettier" },
            javascriptreact = { "prettier" },
            ["javascript.jsx"] = { "prettier" },
            typescript = { "prettier" },
            typescriptreact = { "prettier" },
            ["typescript.tsx"] = { "prettier" },
            json = { "prettier" },
            html = { "prettier" },
            css = { "prettier" },
            yaml = { "prettier" },
            toml = { "prettier" },
            lua = { "luafmt" },
            go = { "gofmt" },
        },
    }

    return default_opts
end
