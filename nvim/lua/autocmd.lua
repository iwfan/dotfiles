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
    { "BufEnter", [[/tmp/*]], "setlocal noundofile" },
    { "BufEnter", "COMMIT_EDITMSG", "setlocal noundofile" },
    { "BufEnter", "MERGE_MSG", "setlocal noundofile" },
    { "BufEnter", [[*.tmp]], "setlocal noundofile" },
    { "BufEnter", [[*.bak]], "setlocal noundofile" },
    { "BufEnter", "*.css,*.scss,*.less", "setlocal iskeyword+=-" },
    { "BufEnter", "markdown", "setlocal wrap" },
    { "FileType", "make", "setlocal noexpandtab" },
    { "TermOpen", "term://*", "startinsert" },
    { "TermOpen", "term://*", "setlocal nonumber norelativenumber" },
    { "TermClose", "term://*", [[if &filetype == 'term' | bd! | else | stopinsert | endif]] },
})

augroup("misc", {
    {
        "BufEnter",
        [[*.png,*.jpg,*.gif]],
        [[exec "silent !open ".expand("%") | :bw]],
    },
    { "InsertEnter", "*", "noh" },
    { "FocusLost", "*", [[silent! wa]] }, -- auto save when nvim focus
    { "BufWritePre", "*", [[%s/\s\+$//e]] }, -- remove trailing whitespaces
    { "BufWritePre", "*", [[%s/\n\+\%$//e]] },
})
