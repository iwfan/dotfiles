local enhance_attach = require "lsp.enhance_attach"

return function(opts)
    opts.capabilities.textDocument.completion.completionItem.snippetSupport = true
    opts.capabilities.textDocument.completion.completionItem.preselectSupport = true
    opts.capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
    opts.capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
    opts.capabilities.textDocument.completion.completionItem.deprecatedSupport = true
    opts.capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
    opts.capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
    opts.capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
            "documentation",
            "detail",
            "additionalTextEdits",
        },
    }

    opts.init_options = require("nvim-lsp-ts-utils").init_options
    opts.on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false

        require("nvim-lsp-ts-utils").setup {
            enable_import_on_completion = true,
        }

        require("nvim-lsp-ts-utils").setup_client(client)
        enhance_attach(client, bufnr)
    end

    return opts
end
