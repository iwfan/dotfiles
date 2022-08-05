return function(on_attach, capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require("lspconfig").ccls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end
