local tree_cb = require "nvim-tree.config".nvim_tree_callback
var_tbl {
  nvim_tree_width              = 40,
  nvim_tree_indent_markers     = 1,
  nvim_tree_follow             = 1,
  nvim_tree_quit_on_open       = 1,
  nvim_tree_git_hl             = 1,
  nvim_tree_width_allow_resize = 1,
  nvim_tree_ignore             = { ".git", ".cache", ".idea", ".DS_Store" },
  nvim_tree_special_files      = { 'README.md', 'Makefile', 'MAKEFILE' },
  nvim_tree_bindings           = {
    ["l"] = tree_cb("edit"),
    ["h"] = tree_cb("close_node")
  },
  nvim_tree_icons              = {
    default     = emoji_icon.file,
    symlink     = emoji_icon.link,
    git         = {
      unstaged  = font_icon.modifiy,
      staged    = font_icon.add,
      unmerged  = font_icon.merge,
      renamed   = font_icon.renamed,
      untracked = font_icon.unknown,
      deleted   = font_icon.deleted,
      ignored   = font_icon.ignored
    },
    folder      = {
      default   = emoji_icon.folder,
      open      = emoji_icon.folder_opened,
      symlink   = emoji_icon.link
    }
  }
}

map_cmd("n|<leader>1", "NvimTreeToggle")
