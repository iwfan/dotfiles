local enhance_attach = require "plugins.configs.lsp.lsp_attach"

require("mason-lspconfig").setup {
    ensure_installed = {
        -- "beancount", -- High CPU usage
        "denols",
        "html",
        "cssls",
        "tailwindcss",
        "tsserver",
        "eslint",
        "jsonls",
        "gopls",
        "lua_ls",
        "solargraph"
    },
}

require("mason-lspconfig").setup_handlers {
    function(server_name)
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities.textDocument.foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true
        }

        local opts = {
            on_attach = enhance_attach,
            capabilities = capabilities,
        }

        local ok, server_setup = pcall(require, "plugins.configs.lsp.servers." .. server_name)
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
        null_ls.builtins.formatting.prettier.with {
            prefer_local = "node_modules/.bin",
            filetypes = { "astro" },
            extra_args = { "--plugin-search-dir", "." },
        },
        null_ls.builtins.formatting.stylua.with {
            extra_args = { "--config-path", vim.fn.expand "~/dotfiles/stylua.toml" },
        },
    },
}
