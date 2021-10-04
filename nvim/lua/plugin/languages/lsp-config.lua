local enhance_attach = function(client, bufnr)
    local function buf_set_keymap(...)
        vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    local function buf_set_option(...)
        vim.api.nvim_buf_set_option(bufnr, ...)
    end

    -- Enable completion triggered by <c-x><c-o>
    buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

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

    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
    buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    buf_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
    buf_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
    buf_set_keymap("n", "gk", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
    buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
    buf_set_keymap("n", "<space><cr>", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
    buf_set_keymap("n", "\\d", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
    buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
    buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
    buf_set_keymap("n", "<space>d", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
    buf_set_keymap("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
    buf_set_keymap("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)

    buf_set_keymap("n", "<F5>", "vsplit" .. vim.lsp.get_log_path(), opts)
end

local lspconf = require("lspconfig")
local coq = require("coq")

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
                enable_import_on_completion = true,
                -- import all
                import_all_timeout = 5000, -- ms
                import_all_priorities = {
                    buffers = 4, -- loaded buffer names
                    buffer_content = 3, -- loaded buffer content
                    local_files = 2, -- git files or files with relative path markers
                    same_file = 1, -- add to existing import statement
                },
                import_all_scan_buffers = 100,
                import_all_select_source = false,
                -- eslint
                eslint_enable_code_actions = true,
                eslint_enable_disable_comments = true,
                eslint_enable_diagnostics = false,
                eslint_bin = "eslint_d",
                eslint_opts = {
                    "-f",
                    "json",
                    "--stdin",
                    "--stdin-filename",
                    "$FILENAME",
                },

                -- formatting
                enable_formatting = false,
                formatter = "prettier",
                formatter_opts = { "--stdin-filepath", "$FILENAME" },

                -- update imports on file move
                update_imports_on_move = false,
                require_confirmation_on_move = false,
                watch_dir = nil,

                -- filter diagnostics
                filter_out_diagnostics_by_severity = {},
                filter_out_diagnostics_by_code = {},
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
    lspconf[lang].setup(coq.lsp_ensure_capabilities(conf))
end
