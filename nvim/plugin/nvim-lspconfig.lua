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

            local map = function(keys, func, desc, mode)
                mode = mode or "n"
                vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
            end

            -- FzfLua picker mappings
            -- local fzf = require "fzf-lua"
            -- map("gd", fzf.lsp_definitions, "[G]oto [D]definition")
            -- map("grr", fzf.lsp_references, "[G]oto [R]references")
            -- map("gri", fzf.lsp_implementations, "[G]oto [I]mplementation")
            -- map("grd", fzf.lsp_declarations, "[G]oto [D]eclaration")
            -- map("grt", fzf.lsp_typedefs, "[G]oto [T]ype Definition")
            -- map("gO", fzf.lsp_document_symbols, "Open Document Symbols")
            -- map("gW", fzf.lsp_live_workspace_symbols, "Open Workspace Symbols")
            --
            -- map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
            -- map("<space><enter>", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
            -- map("\\d", vim.diagnostic.open_float, "Hover")
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
