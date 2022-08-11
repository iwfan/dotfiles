return function(on_attach, capabilities)
    require("lspconfig").astro.setup {
        on_attach = function(client, bufnr)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
            on_attach(client, bufnr)
        end,
        capabilities = capabilities,
    }
end
