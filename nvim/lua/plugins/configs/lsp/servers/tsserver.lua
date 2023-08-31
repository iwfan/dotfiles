return function(on_attach, capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require("lspconfig").tsserver.setup {
        -- pass options to lspconfig's setup method
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = true
            client.server_capabilities.document_range_formatting = true
            on_attach(client, bufnr)
        end,
    }
end
