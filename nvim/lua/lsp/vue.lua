local nvim_lsp = require("lspconfig")
local set_lsp_config = require("lsp/set_config")

nvim_lsp.vuels.setup {
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    set_lsp_config(client, bufnr)
  end
}
