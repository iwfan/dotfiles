local enhance_attach = function(client, bufnr)
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec(
            [[
    augroup lsp_document_formatter
      autocmd! * <buffer>
      autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil,1000)
    augroup END
    ]],
            false
        )
        -- map_cmd("n|<space>fm", "lua vim.lsp.buf.formatting()")
    end

    -- if client.resolved_capabilities.document_range_formatting then
    --   map_cmd("v|<space>fm", "lua vim.lsp.buf.range_formatting()")
    -- end

    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec(
            [[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=#32302f
        hi LspReferenceText cterm=bold ctermbg=red guibg=#32302f
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=#32302f
        augroup lsp_document_highlight
          autocmd! * <buffer>
          autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
          autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
      ]],
            false
        )
    end
end

map_cmd("n|]d", "Lspsaga diagnostic_jump_next")
map_cmd("n|[d", "Lspsaga diagnostic_jump_prev")
map_cmd([[n|\d]], "Lspsaga show_line_diagnostics")
map_cmd("n|K", "Lspsaga hover_doc")
map_cmd("n|<space><cr>", "Lspsaga code_action")
map_cmd("v|<space><cr>", "Lspsaga range_code_action")
map_cmd("n|gd", "lua vim.lsp.buf.definition()")
map_cmd("n|gD", "lua vim.lsp.buf.declaration()")
map_cmd("n|gi", "lua vim.lsp.buf.implementation()")
map_cmd("n|<space>rn", "Lspsaga rename")
map_cmd("n|<space>u", "Lspsaga lsp_finder")
map_cmd("n|<space>q", "TroubleToggle")
map_cmd("n|<F5>", "vsplit" .. vim.lsp.get_log_path())
map_cmd("n|<space>K", "Lspsaga signature_help")
-- map_cmd("n|<C-f>", "lua require('lspsaga.action').smart_scroll_with_saga(1)", { nowait = true })
-- map_cmd("n|<C-b>", "lua require('lspsaga.action').smart_scroll_with_saga(-1)", { nowait = true })
-- map_cmd("n|<Leader>cw", "lua vim.lsp.buf.workspace_symbol()")
-- map_cmd("n|D", "lua vim.lsp.buf.type_definition()")
-- map_cmd("n|gr", "lua vim.lsp.buf.references()")
-- map_cmd("n|<space>fm", "lua vim.lsp.buf.formatting_sync(nil,1000)")
-- map_cmd("v|<space>fm", "lua vim.lsp.buf.range_formatting()")

local lspconf = require("lspconfig")

-- Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
}

local sumneko_root_path = config_path .. "/lsp-install/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"

local servers = {
    html = {
        filetypes = {
            "django-html",
            "edge",
            "ejs",
            "erb",
            "gohtml",
            "haml",
            "handlebars",
            "hbs",
            "html",
            "html-eex",
            "jade",
            "markdown",
            "mdx",
            "mustache",
            "vue",
            "svelte",
        },
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            enhance_attach(client, bufnr)
        end,
        capabilities = capabilities,
    },
    cssls = {
        filetypes = { "css", "less", "scss", "styls" },
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            enhance_attach(client, bufnr)
        end,
        capabilities = capabilities,
    },
    tsserver = {
        on_attach = function(client, bufnr)
            if client.config.flags then
                client.config.flags.allow_incremental_sync = true
            end
            client.resolved_capabilities.document_formatting = false

            local ts_utils = require("nvim-lsp-ts-utils")
            -- defaults
            ts_utils.setup({
                debug = false,
                disable_commands = false,
                enable_import_on_completion = false,
                import_on_completion_timeout = 5000,

                -- eslint
                eslint_bin = "eslint_d",
                eslint_args = {
                    "-f",
                    "json",
                    "--stdin",
                    "--stdin-filename",
                    "$FILENAME",
                },
                eslint_enable_disable_comments = true,

                -- experimental settings!
                -- eslint diagnostics
                eslint_enable_diagnostics = false,
                eslint_diagnostics_debounce = 250,

                -- formatting
                enable_formatting = false,
                formatter = "prettier",
                formatter_args = { "--stdin-filepath", "$FILENAME" },
                format_on_save = false,
                no_save_after_format = false,

                -- parentheses completion
                complete_parens = false,
                signature_help_in_parens = false,

                -- update imports on file move
                update_imports_on_move = false,
                require_confirmation_on_move = false,
                watch_dir = "/src",
            })

            -- required to enable ESLint code actions and formatting
            ts_utils.setup_client(client)

            -- no default maps, so you may want to define some here
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", { silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", { silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", { silent = true })
            vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", { silent = true })

            enhance_attach(client, bufnr)
        end,
    },
    tailwindcss = { on_attach = enhance_attach },
    jsonls = { on_attach = enhance_attach },
    yamlls = { on_attach = enhance_attach },
    vuels = { on_attach = enhance_attach },
    bashls = { on_attach = enhance_attach },
    dockerls = { on_attach = enhance_attach },
    diagnosticls = {
        cmd = { "diagnostic-languageserver", "--stdio", "--log-level", "2" },
        filetypes = {
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
        },
        init_options = {
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
        },
        root_dir = function()
            return vim.loop.cwd()
        end,
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = true
            enhance_attach(client, bufnr)
        end,
    },
    sumneko_lua = {
        cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
        root_dir = function()
            return vim.loop.cwd()
        end,
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            enhance_attach(client, bufnr)
        end,
        capabilities = capabilities,
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                    path = vim.split(package.path, ";"),
                },
                diagnostics = {
                    enable = true,
                    globals = {
                        "vim",
                        "hs",
                        "spoon",
                        "packer_plugins",
                        "use",
                        "describe",
                        "it",
                        "assert",
                        "before_each",
                        "after_each",
                    },
                },
                workspace = {
                    library = {
                        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                        [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
                    },
                },
                telemetry = { enable = false },
            },
        },
    },
    solargraph = { on_attach = enhance_attach },
    sorbet = { on_attach = enhance_attach },
    gopls = {
        cmd = { "gopls", "--remote=auto" },
        filetypes = { "go", "gomod" },
        root_dir = function()
            return vim.loop.cwd()
        end,
        on_attach = enhance_attach,
        capabilities = capabilities,
        init_options = { usePlaceholders = true, completeUnimported = true },
    },
    rust_analyzer = { on_attach = enhance_attach, capabilities = capabilities },
}

for lang, conf in pairs(servers) do
    lspconf[lang].setup(conf)
end
