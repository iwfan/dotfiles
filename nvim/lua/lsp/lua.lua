local nvim_lsp = require("lspconfig")
local set_lsp_config = require("lsp/set_config")

nvim_lsp.sumneko_lua.setup {
  cmd = {
    vim.fn.stdpath("data") .. "/lspinstall/lua/sumneko-lua-language-server"
  },
  settings = {
    Lua = {
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "packer_plugins",
          "use",
          "describe",
          "it",
          "assert",
          "before_each",
          "after_each"
        }
      },
      runtime = {version = "LuaJIT"},
      workspace = {
        library = vim.list_extend({[vim.fn.expand("$VIMRUNTIME/lua")] = true}, {})
      }
    }
  },
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    set_lsp_config(client, bufnr)
  end
}
