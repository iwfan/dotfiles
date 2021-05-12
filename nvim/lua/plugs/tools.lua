local M = {}

function M.colorizer()
  require "colorizer".setup()
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
