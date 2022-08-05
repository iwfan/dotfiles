return function(_, capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require("lspconfig").tailwindcss.setup {
        on_attach = function(client)
            client.resolved_capabilities.document_formatting = false
            client.resolved_capabilities.document_range_formatting = false
        end,

        capabilities = capabilities,
    }
end
