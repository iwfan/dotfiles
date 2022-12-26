return function(on_attach, capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require("lspconfig").jsonls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
