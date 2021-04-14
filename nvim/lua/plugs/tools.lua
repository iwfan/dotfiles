local M = {}

function M.colorizer()
  require "colorizer".setup(
    {
      css = {rgb_fn = true},
      scss = {rgb_fn = true},
      sass = {rgb_fn = true},
      stylus = {rgb_fn = true},
      vim = {names = true},
      tmux = {names = false},
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      html = {
        mode = "foreground"
      }
    }
  )
end

function M.gitsigns()
  if not packer_plugins["plenary.nvim"].loaded then
    vim.cmd [[packadd plenary.nvim]]
  end
  require("gitsigns").setup {
    signs = {
      add = {hl = "GitGutterAdd", text = "▋"},
      change = {hl = "GitGutterChange", text = "▋"},
      delete = {hl = "GitGutterDelete", text = "▋"},
      topdelete = {hl = "GitGutterDeleteChange", text = "▔"},
      changedelete = {hl = "GitGutterChange", text = "▎"}
    },
    current_line_blame = true
  }
end

return M
