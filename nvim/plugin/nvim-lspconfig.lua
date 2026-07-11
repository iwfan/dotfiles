-- ============================================================================
-- Diagnostic config (global)
-- ============================================================================
vim.diagnostic.config {
    severity_sort = true,
    float = { severity_sort = true, border = "rounded", source = "if_many" },
    underline = true,
    signs = false,
    virtual_text = false,
    virtual_lines = false,
}

-- ============================================================================
-- LSP server configs
-- ============================================================================
local function setup_lspconfig()
    vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
        callback = function(event)
            vim.bo[event.buf].omnifunc = "v:lua.MiniCompletion.completefunc_lsp"

            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.name == "mini.snippets" then
                return
            end

            vim.lsp.inlay_hint.enable()

            local map = function(keys, func, desc, mode)
                mode = mode or "n"
                vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
            end

            -- LSP goto / actions
            map("gd", vim.lsp.buf.definition, "[G]oto [D]efinition")
            map("grr", vim.lsp.buf.references, "[G]oto [R]eferences")
            map("gri", vim.lsp.buf.implementation, "[G]oto [I]mplementation")
            map("grt", vim.lsp.buf.type_definition, "[G]oto [T]ype Definition")
            map("gO", vim.lsp.buf.document_symbol, "Open Document Symbols")
            map("gW", vim.lsp.buf.workspace_symbol, "Open Workspace Symbols")
            map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
            map("<space><enter>", vim.lsp.buf.code_action, "Code [A]ction", { "n", "x" })
            map("\\d", vim.diagnostic.open_float, "Hover diagnostic")
        end,
    })

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

    local installed_servers = {
        lua_ls = {
            settings = {
                Lua = {
                    completion = {
                        callSnippet = "Replace",
                    },
                },
            },
        },
        cssls = {},
        html = {},
        gopls = {},
        astro = {},
        basedpyright = {},
        tailwindcss = {},
        vue_ls = {},
        vtsls = vtsls_config,
    }

    for server, server_opts in pairs(installed_servers) do
        local capabilities = require("mini.completion").get_lsp_capabilities()
        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
        }
        local opts = {
            capabilities = capabilities,
        }

        vim.lsp.config(server, vim.tbl_extend("force", server_opts, opts))
        vim.lsp.enable(server)
    end
end

setup_lspconfig()
