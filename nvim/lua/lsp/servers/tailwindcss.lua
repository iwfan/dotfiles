return function(_, capabilities)
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    require("lspconfig").tailwindcss.setup {
        on_attach = function(client)
            client.server_capabilities.document_formatting = false
            client.server_capabilities.document_range_formatting = false
        end,
        -- autostart = false,
        capabilities = capabilities,
    }
end
