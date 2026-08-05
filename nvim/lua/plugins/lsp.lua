return {
    -- Mason: LSP/DAP/Linter installer
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {
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
                "biome",
                "css-lsp",
                "gopls",
                "html-lsp",
                "lua-language-server",
                "ruff",
                "tailwindcss-language-server",
                "typos",
                "vtsls",
                "vue-language-server",
            },
        },
    },

    -- Bridge between mason and lspconfig
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {},
    },

    -- LSP configuration
    {
        "neovim/nvim-lspconfig",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            {
                "folke/lazydev.nvim",
                ft = "lua",
                cmd = "LazyDev",
                opts = {
                    library = {
                        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                        { path = "LazyVim", words = { "LazyVim" } },
                        { path = "snacks.nvim", words = { "Snacks" } },
                        { path = "lazy.nvim", words = { "LazyVim" } },
                        { path = "nvim-lspconfig", words = { "lspconfig.settings" } },
                    },
                },
            },
        },
        config = function()
            -- Diagnostic config
            vim.diagnostic.config {
                severity_sort = true,
                float = { severity_sort = true, border = "rounded", source = "if_many" },
                underline = true,
                signs = false,
                virtual_text = false,
                virtual_lines = false,
            }

            -- LSP attach keymaps
            vim.api.nvim_create_autocmd("LspAttach", {
                group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
                callback = function(event)
                    local client = vim.lsp.get_client_by_id(event.data.client_id)
                    local map = function(keys, func, desc, mode)
                        mode = mode or "n"
                        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
                    end

                    if client and client:supports_method("textDocument/inlayHint", { bufnr = event.buf }) then
                        vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
                        map("<leader>th", function()
                            local enabled = vim.lsp.inlay_hint.is_enabled { bufnr = event.buf }
                            vim.lsp.inlay_hint.enable(not enabled, { bufnr = event.buf })
                        end, "Toggle Inlay Hints")
                    end

                    map("gd", Snacks.picker.lsp_definitions, "[G]oto [D]efinition")
                    map("gr", Snacks.picker.lsp_references, "[G]oto [R]eferences")
                    map("gD", Snacks.picker.lsp_declarations, "[G]oto [D]eclaration")
                    map("gI", Snacks.picker.lsp_implementations, "[G]oto [I]mplementation")
                    map("gy", Snacks.picker.lsp_type_definitions, "[G]oto [T]ype Definition")
                    map("gO", vim.lsp.buf.document_symbol, "Open Document Symbols")
                    map("gW", vim.lsp.buf.workspace_symbol, "Open Workspace Symbols")
                    map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
                    map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
                    map("K", vim.lsp.buf.hover, "Hover Documentation")
                end,
            })

            -- Server configurations
            local vue_language_server_path = vim.fn.stdpath "data"
                .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
            local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
            local vue_plugin = {
                name = "@vue/typescript-plugin",
                location = vue_language_server_path,
                languages = { "vue" },
                configNamespace = "typescript",
            }
            local vtsls_config = {
                settings = {
                    typescript = {
                        inlayHints = {
                            parameterNames = { enabled = "literals" },
                            parameterTypes = { enabled = true },
                            variableTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            enumMemberValues = { enabled = true },
                        },
                    },
                    javascript = {
                        inlayHints = {
                            parameterNames = { enabled = "literals" },
                            parameterTypes = { enabled = true },
                            variableTypes = { enabled = true },
                            propertyDeclarationTypes = { enabled = true },
                            functionLikeReturnTypes = { enabled = true },
                            enumMemberValues = { enabled = true },
                        },
                    },
                    vtsls = {
                        tsserver = {
                            globalPlugins = {
                                vue_plugin,
                            },
                        },
                    },
                },
                filetypes = tsserver_filetypes,
            }

            local servers = {
                lua_ls = {
                    settings = {
                        Lua = {
                            hint = {
                                enable = true,
                            },
                            completion = {
                                callSnippet = "Replace",
                            },
                        },
                    },
                },
                cssls = {},
                html = {},
                gopls = {
                    settings = {
                        gopls = {
                            hints = {
                                assignVariableTypes = true,
                                compositeLiteralFields = true,
                                compositeLiteralTypes = true,
                                constantValues = true,
                                functionTypeParameters = true,
                                parameterNames = true,
                                rangeVariableTypes = true,
                            },
                        },
                    },
                },
                astro = {},
                basedpyright = {
                    settings = {
                        basedpyright = {
                            analysis = {
                                inlayHints = {
                                    variableTypes = true,
                                    callArgumentNames = true,
                                    functionReturnTypes = true,
                                    genericTypes = true,
                                },
                            },
                        },
                    },
                },
                ruff = {},
                tailwindcss = {},
                vue_ls = {},
                vtsls = vtsls_config,
            }

            local capabilities = require("blink.cmp").get_lsp_capabilities()

            for server, server_opts in pairs(servers) do
                local opts = {
                    capabilities = capabilities,
                }
                vim.lsp.config(server, vim.tbl_extend("force", server_opts, opts))
                vim.lsp.enable(server)
            end
        end,
    },
}
