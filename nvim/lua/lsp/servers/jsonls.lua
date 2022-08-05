return function(on_attach, capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require("lspconfig").ccls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            json = {
                schemas = require("schemastore").json.schemas(),
                validate = { enable = true },
            },
        },
    }
end
