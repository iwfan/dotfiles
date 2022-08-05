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
        },
    }

    local luadev = require("lua-dev").setup {
        lspconfig = {
            on_attach = on_attach,
            settings = settings,
            flags = {
                debounce_text_changes = 150,
            },
            capabilities = capabilities,
        },
    }

    require("lspconfig").sumneko_lua.setup(luadev)
end
