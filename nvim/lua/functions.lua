local helpers = require 'helpers'

helpers.parse_from_definition_table{
  filetype_detect = {
    { "BufNewFile,BufRead", "COMMIT_EDITMSG", "setf gitcommit" };
    { "BufNewFile,BufRead", "MERGE_MSG", "setf gitcommit" };
    { "BufNewFile,BufRead", "*.git/config,.gitconfig,.gitmodules", "setf gitcommit" };
    { "BufNewFile,BufRead", "*.git/modules/*/config", "setf gitcommit" };
    { "BufNewFile,BufRead", "git-rebase-todo", "setf gitcommit" };
    { "BufNewFile,BufRead", ".msg.[0-9]*", table.concat{
      [[if getline(1) =~ '^From.*# This line is ignored.$' |]];
      [[setf gitsendemail | endif]];
    }};
    { "BufNewFile,BufRead", "*.git/*", table.concat{
      [[if getline(1) =~ '^\x\{40\}\>\|^ref: ' |]];
      [[setf git | endif]];
    }};

    { "BufNewFile,BufRead", "*.tsx,*.jsx", "setf typescriptreact" };
  };

  filetype_config = {
    { "BufWritePre", [[/tmp/*]], "setlocal noundofile"};
    { "BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"};
    { "BufWritePre", "MERGE_MSG", "setlocal noundofile"};
    { "BufWritePre", [[*.tmp]], "setlocal noundofile"};
    { "BufWritePre", [[*.bak]], "setlocal noundofile"};

    { "BufWritePre", "*", "setlocal formatoptions-=cro formatoptions+=j1"};
    { "BufWritePre", "*.css,*.scss,*.less", "setlocal iskeyword+=-"};
    { "BufWritePre", "*.md", "setlocal wrap"};
  };

  others = {
    { "BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]};
    { "TermOpen", "term://*", "startinsert"};
  };

  windows = {
    { "VimResized", "*", [[wincmd =]]};
    { "FileType", "help", [[wincmd L]]};
  };

  external = {
    { "BufEnter", [[*.png,*.jpg,*.gif]], [[exec "silent !open ".expand("%") | :bw]] };
  };

  yank = {
    { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank {timeout=500}]] };
  };
}
