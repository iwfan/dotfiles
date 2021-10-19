augroup("filetype_detect", {
    { "BufNewFile,BufRead", "COMMIT_EDITMSG", "setf gitcommit" },
    { "BufNewFile,BufRead", "MERGE_MSG", "setf gitcommit" },
    { "BufNewFile,BufRead", "git-rebase-todo", "setf gitcommit" },
    { "BufNewFile,BufRead", "*.conf,*.tmux", "setf dosini" },
    { "BufNewFile,BufRead", "*.fish", "setf fish" },
    { "BufNewFile,BufRead", "_ideavimrc", "setf vim" },
    { "BufNewFile,BufRead", "*.tsx,*.jsx", "setf typescriptreact" },
    { "BufNewFile,BufRead", ".eslintrc,.prettierrc", "setf json" },
    { "BufNewFile,BufRead", "tsconfig.json", "setf jsonc" },
})

augroup("filetype_config", {
    { "BufEnter", [[/tmp/*]], "setl noundofile" },
    { "BufEnter", "COMMIT_EDITMSG", "setl noundofile" },
    { "BufEnter", "MERGE_MSG", "setl noundofile" },
    { "BufEnter", [[*.tmp]], "setl noundofile" },
    { "BufEnter", [[*.bak]], "setl noundofile" },
    { "BufEnter", "*.css,*.scss,*.less", "setl iskeyword+=-" },
    { "BufEnter", "markdown", "setl wrap" },
    { "FileType", "scss", "setl iskeyword+=@-@" },
    { "FileType", "make", "setl noexpandtab" },
    { "TermOpen", "term://*", "startinsert" },
    { "TermOpen", "term://*", "setl nonumber norelativenumber signcolumn=no" },
    { "TermClose", "term://*", [[if &filetype == 'term' | bd! | else | stopinsert | endif]] },
})

augroup("misc", {
    {
        "BufEnter",
        [[*.png,*.jpg,*.gif]],
        [[exec "silent !open ".expand("%")]],
    },
    { "InsertEnter", "*", "noh" },
    { "FocusLost", "*", [[silent! wa]] }, -- auto save when nvim focus
    { "BufWritePre", "*", [[%s/\s\+$//e]] }, -- remove trailing whitespaces
    { "BufWritePre", "*", [[%s/\n\+\%$//e]] },
})
