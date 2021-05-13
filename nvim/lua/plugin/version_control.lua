local version_control = {}
local insert = _G.insert(version_control)

insert "tpope/vim-fugitive"

insert {
  "lewis6991/gitsigns.nvim",
  event = {"BufRead", "BufNewFile"},
  config = function()
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
  end,
  requires = {"nvim-lua/plenary.nvim", opt = true}
}

return version_control

