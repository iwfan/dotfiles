return function(on_attach, capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require("lspconfig").solargraph.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        settings = {
            solargraph = {
                diagnostics = true,
                useBundler = true,
            },
        },
    }
end
