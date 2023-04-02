return function(on_attach, capabilities)
    local settings = {
        Lua = {
            diagnostics = {
                globals = {
                    "vim",
                    "hs",
                    "spoon",
                    "packer_plugins",
                    "use",
                    "describe",
                    "it",
                    "assert",
                    "before_each",
                    "after_each",
                },
            },
            workspace = {
                checkThirdParty = false,
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
            completion = {
                callSnippet = "Replace",
            },
        },
    }

    require("lspconfig").lua_ls.setup {
        on_attach = function(client, bufnr)
            client.server_capabilities.document_formatting = true
            client.server_capabilities.document_range_formatting = true
            on_attach(client, bufnr)
        end,
        settings = settings,
        capabilities = capabilities,
    }
end
