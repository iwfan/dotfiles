return function(opts)
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    opts.capabilities.textDocument.colorProvider = { dynamicRegistration = false }
    opts.on_attach = function(client, bufnr)
        if client.server_capabilities.colorProvider then
            require("lsp/documentcolors").buf_attach(bufnr)
        end
    end

    return opts
end
