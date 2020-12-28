local helpers = require 'helpers'

helpers.parse_from_definition_table{
  -- filetypedetect = {
  --   { "BufNewFile,BufRead", "COMMIT_EDITMSG", "setf gitcommit" };
  --   { "BufNewFile,BufRead", "MERGE_MSG", "setf gitcommit" };
  --   { "BufNewFile,BufRead", "*.git/config,.gitconfig,.gitmodules", "setf gitcommit" };
  --   { "BufNewFile,BufRead", "*.git/modules/*/config", "setf gitcommit" };
  --   { "BufNewFile,BufRead", "git-rebase-todo", "setf gitcommit" };
  --   { "BufNewFile,BufRead", "*.tsx,*.jsx", "setf typescriptreact" };
  -- };

  -- user_persistent_undo = {
  --   { "BufWritePre", [[/tmp/*]], "setlocal noundofile"}
  -- };

  yank = {
    { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank {timeout=500}]] };
  }
}
