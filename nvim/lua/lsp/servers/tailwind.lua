return function(opts)
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
    end
    return opts
end
