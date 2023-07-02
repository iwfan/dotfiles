return function(on_attach, capabilities)
    require("typescript").setup {
        disable_commands = false, -- prevent the plugin from creating Vim commands
        debug = false, -- enable debug logging for commands
        server = {
            -- pass options to lspconfig's setup method
            on_attach = function(client, bufnr)
                client.server_capabilities.document_formatting = true
                client.server_capabilities.document_range_formatting = true
                on_attach(client, bufnr)
            end,
            capabilities = capabilities,
            root_dir = require("lspconfig").util.root_pattern "package.json",
        },
    }
end
