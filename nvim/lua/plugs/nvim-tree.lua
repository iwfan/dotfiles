local helpers = require "helpers"

local bind_key = helpers.bind_key
local map_cr = helpers.map_cr

helpers.parse_variable_from_table {
  nvim_tree_side = "left",
  nvim_tree_indent_markers = 1,
  nvim_tree_ignore = {".git", "node_modules", ".cache"},
  nvim_tree_auto_open = 0,
  nvim_tree_auto_close = 1,
  nvim_tree_quit_on_open = 1,
  nvim_tree_follow = 1,
  nvim_tree_git_hl = 1,
  nvim_tree_tab_open = 1,
  nvim_tree_width_allow_resize = 1,
  nvim_tree_bindings = {
    edit = {"<CR>", "l", "h"}
  },
  nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
      unstaged = "✚",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "★"
    },
    folder = {
      default = "",
      open = "",
      symlink = ""
    }
  }
}
