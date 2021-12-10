return function(opts)
    opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = true
    end

    return opts
end
