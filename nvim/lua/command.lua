local helpers = require "helpers"

helpers.parse_from_definition_table {
  filetype_detect = {
    {"BufNewFile,BufRead", "COMMIT_EDITMSG", "setf gitcommit"},
    {"BufNewFile,BufRead", "MERGE_MSG", "setf gitcommit"},
    {"BufNewFile,BufRead", "*.git/config,.gitconfig,.gitmodules", "setf gitcommit"},
    {"BufNewFile,BufRead", "*.git/modules/*/config", "setf gitcommit"},
    {"BufNewFile,BufRead", "git-rebase-todo", "setf gitcommit"},
    {
      "BufNewFile,BufRead",
      ".msg.[0-9]*",
      table.concat {
        [[if getline(1) =~ '^From.*# This line is ignored.$' |]],
        [[setf gitsendemail | endif]]
      }
    },
    {
      "BufNewFile,BufRead",
      "*.git/*",
      table.concat {
        [[if getline(1) =~ '^\x\{40\}\>\|^ref: ' |]],
        [[setf git | endif]]
      }
    },
    {"BufNewFile,BufRead", "_ideavimrc", "setf vim"},
    {"BufNewFile,BufRead", "*.tsx,*.jsx", "setf typescriptreact"},
    {"TermOpen", "term://*", "setf terminal"}
  },
  filetype_config = {
    {"BufWritePre", [[/tmp/*]], "setlocal noundofile"},
    {"BufWritePre", "COMMIT_EDITMSG", "setlocal noundofile"},
    {"BufWritePre", "MERGE_MSG", "setlocal noundofile"},
    {"BufWritePre", [[*.tmp]], "setlocal noundofile"},
    {"BufWritePre", [[*.bak]], "setlocal noundofile"},
    {"BufWritePre", "*", "setlocal formatoptions-=cro formatoptions+=j1"},
    {"BufWritePre", "*.css,*.scss,*.less", "setlocal iskeyword+=-"},
    {"BufWritePre", "*.md", "setlocal wrap"},
    -- Makefile
    {"FileType", "make", "setlocal noexpandtab"}
  },
  others = {
    {"BufEnter", [[*.png,*.jpg,*.gif]], [[exec "silent !open ".expand("%") | :bw]]},
    {"BufReadPost", "*", [[if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif]]},
    {"FocusLost", "*", [[silent! wa]]},
    {"FileType", "help", [[wincmd L]]},
    {"TermOpen", "term://*", "startinsert"},
    {"TermOpen", "term://*", "setlocal nonumber norelativenumber"},
    {"TextYankPost", "*", [[silent! lua vim.highlight.on_yank {timeout=500}]]},
    {
      "BufEnter",
      "NvimTree",
      table.concat {
        [[if &ft == 'NvimTree' |]],
        [[exec 'NvimTreeRefresh' | endif]]
      }
    }
  }
}
