local version_control = {}
local insert = _G.insert(version_control)

insert { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }

insert "tpope/vim-fugitive"

insert {
  "lewis6991/gitsigns.nvim",
  config = function()
    require("gitsigns").setup {
      signs = {
        add = {hl = "GitGutterAdd",                text = "▋"},
        change = {hl = "GitGutterChange",          text = "▋"},
        delete = {hl = "GitGutterDelete",          text = "▋"},
        topdelete = {hl = "GitGutterDeleteChange", text = "▔"},
        changedelete = {hl = "GitGutterChange",    text = "▎"}
      },
      current_line_blame = true
    }
  end,
  requires = {"nvim-lua/plenary.nvim", opt = true}
}

return version_control
