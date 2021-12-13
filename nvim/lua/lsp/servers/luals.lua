return function(opts)
    opts.settings = {
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
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    }
    return opts
end
