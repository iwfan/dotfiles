local enhance_attach = require "lsp.lsp_attach"
local lsp_status = require "lsp-status"

lsp_status.register_progress()

require("mason-lspconfig").setup {
    ensure_installed = {
        "html",
        "cssls",
        "tailwindcss",
        "tsserver",
        "eslint",
        "jsonls",
        "yamlls",
        "gopls",
        "sumneko_lua",
    },
}

require("mason-lspconfig").setup_handlers {
    function(server_name)
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_extend("keep", capabilities, lsp_status.capabilities) or {}
        capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

        local opts = {
            on_attach = enhance_attach,
            capabilities = capabilities,
        }

        local ok, server_setup = pcall(require, "lsp.servers." .. server_name)
        if ok then
            server_setup(enhance_attach, capabilities)
        else
            require("lspconfig")[server_name].setup(opts)
        end
    end,
}

local null_ls = require "null-ls"

null_ls.setup {
    sources = {
        null_ls.builtins.formatting.prettierd.with {
            env = {
                PRETTIERD_LOCAL_PRETTIER_ONLY = 1,
            },
        },
        null_ls.builtins.formatting.stylua.with {
            extra_args = { "--config-path", vim.fn.expand "~/dotfiles/stylua.toml" },
        },
    },
}
