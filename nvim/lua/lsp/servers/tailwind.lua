return function(opts)
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    return opts
end
