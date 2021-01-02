vim.api.nvim_set_var("completion_matching_strategy_list", {"exact", "substring", "fuzzy"})

local nvim_lsp = require("lspconfig")
local on_attach = function(client, bufnr)
  -- Keybindings for LSPs
  vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gK", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})

  require "completion".on_attach(client, bufnr)
end

nvim_lsp.vimls.setup {
  on_attach = on_attach
}

nvim_lsp.tsserver.setup {
  on_attach = on_attach
}

nvim_lsp.html.setup {
  on_attach = on_attach
}

nvim_lsp.cssls.setup {
  on_attach = on_attach,
  settings = {
    css = {
      validate = false
    },
    less = {
      validate = true
    },
    scss = {
      validate = true
    }
  }
}

nvim_lsp.sumneko_lua.setup(
  {
    settings = {
      Lua = {
        diagnostics = {
          enable = true,
          globals = {"vim"}
        }
      }
    },
    on_attach = on_attach
  }
)
