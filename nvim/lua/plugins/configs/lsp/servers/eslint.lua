return function(capabilities)
    local lspconfig = require "lspconfig"
    lspconfig.eslint.setup {
        root_dir = lspconfig.util.root_pattern(".eslintrc", ".eslintrc.js", ".eslintrc.json"),
        on_attach = function(client, bufnr)
            client.server_capabilities.documentFormattingProvider = true
            client.server_capabilities.completionProvider = false
        end,
        capabilities = capabilities,
        settings = {
            autoFixOnSave = true,
        },
    }
end
