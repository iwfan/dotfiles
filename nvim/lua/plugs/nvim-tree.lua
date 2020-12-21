vim.api.nvim_set_var('lua_tree_side', 'left')
vim.api.nvim_set_var('lua_tree_hide_dotfiles', 1)
vim.api.nvim_set_var('lua_tree_indent_markers', 1)
vim.api.nvim_set_var('lua_tree_ignore', { '.git', 'node_modules', '.cache' })
vim.api.nvim_set_var('lua_tree_auto_open', 1) 
vim.api.nvim_set_var('lua_tree_auto_close', 1)
vim.api.nvim_set_var('lua_tree_quit_on_open', 1)
vim.api.nvim_set_var('lua_tree_follow', 1)
vim.api.nvim_set_var('lua_tree_indent_markers', 1)
vim.api.nvim_set_var('lua_tree_hide_dotfiles', 1)
vim.api.nvim_set_var('lua_tree_git_hl', 1)
vim.api.nvim_set_var('lua_tree_tab_open', 1)
vim.api.nvim_set_var('lua_tree_width_allow_resize', 1)

vim.api.nvim_set_var('lua_tree_bindings', {
  edit = { '<CR>', 'l', 'h' };
})
vim.api.nvim_set_var('lua_tree_icons', {
  default = '';
  symlink = '';
  git = {
    unstaged = "✚";
    staged = "✓";
    unmerged = "";
    renamed = "➜";
    untracked = "★";
  };
  folder = {
    default = "";
    open = "";
    symlink = "";
  };
})

vim.api.nvim_set_keymap('n', '<leader>1', ':LuaTreeToggle<CR>', { noremap = true })
