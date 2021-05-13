local tree_cb = require "nvim-tree.config".nvim_tree_callback
var_tbl {
  nvim_tree_width              = 40,
  nvim_tree_indent_markers     = 1,
  nvim_tree_auto_open          = 0,
  nvim_tree_auto_close         = 1,
  nvim_tree_quit_on_open       = 1,
  nvim_tree_follow             = 1,
  nvim_tree_git_hl             = 1,
  nvim_tree_tab_open           = 1,
  nvim_tree_width_allow_resize = 1,
  nvim_tree_lsp_diagnostics    = 1,
  nvim_tree_ignore             = { ".git", ".cache", ".idea", ".DS_Store" },
  nvim_tree_special_files      = { 'README.md', 'Makefile', 'MAKEFILE' },
  nvim_tree_bindings           = {
    ["l"] = tree_cb("edit"),
    ["h"] = tree_cb("close_node")
  },
  nvim_tree_icons              = {
    default     = "📄",
    symlink     = "🔗",
    git         = {
      unstaged  = " ",
      staged    = " ",
      unmerged  = "",
      renamed   = " ",
      untracked = " ",
      deleted   = " ",
      ignored   = " "
    },
    folder      = {
      default   = "📁",
      open      = "📂",
      symlink   = "🔗"
    },
    lsp         = {
      hint      = " ",
      info      = " ",
      warning   = " ",
      error     = " ",
    }
  }
}

map_cmd("n|<leader>1", "NvimTreeToggle")
