local nvim_lsp = require("lspconfig")
local set_lsp_config = require("lsp/set_config")

nvim_lsp.cssls.setup {
  cmd = {
    "node",
    vim.fn.stdpath("data") .. "/lspinstall/css" .. "/vscode-css/css-language-features/server/dist/node/cssServerMain.js",
    "--stdio"
  },
  filetypes = {"css", "less", "scss"},
  root_dir = require "lspconfig".util.root_pattern(".git", vim.fn.getcwd()),
  init_options = {
    provideFormatter = false
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    set_lsp_config(client, bufnr)
  end
}
