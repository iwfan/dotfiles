local nvim_lsp = require("lspconfig")
local set_lsp_config = require("lsp/set_config")
local servers = {"rust_analyzer", "pyright", "bashls"}
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {on_attach = set_lsp_config}
end

local ts_servers = {"tsserver"} -- , "denols"
for _, lsp in ipairs(ts_servers) do
  nvim_lsp[lsp].setup {
    on_attach = function(client, bufnr)
      if client.config.flags then
        client.config.flags.allow_incremental_sync = true
      end
      client.resolved_capabilities.document_formatting = false
      set_lsp_config(client, bufnr)
    end
  }
end
require "lsp/lua"
require "lsp/html"
require "lsp/css"
require "lsp/efm"
require "lsp/vue"
