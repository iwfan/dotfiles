return function(on_attach, capabilities)
    local nvim_lsp = require("lspconfig")
    nvim_lsp.denols.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
    }
end
