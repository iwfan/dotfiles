augroup("filetype_detect", {
    { "BufNewFile,BufRead", "COMMIT_EDITMSG", "setf gitcommit" },
    { "BufNewFile,BufRead", "MERGE_MSG", "setf gitcommit" },
    {
        "BufNewFile,BufRead",
        "*.git/config,.gitconfig,.gitmodules",
        "setf gitcommit",
    },
    { "BufNewFile,BufRead", "*.git/modules/*/config", "setf gitcommit" },
    { "BufNewFile,BufRead", "git-rebase-todo", "setf gitcommit" },
    {
        "BufNewFile,BufRead",
        ".msg.[0-9]*",
        table.concat({
            [[if getline(1) =~ '^From.*# This line is ignored.$' |]],
            [[setf gitsendemail | endif]],
        }),
    },
    {
        "BufNewFile,BufRead",
        "*.git/*",
        table.concat({
            [[if getline(1) =~ '^\x\{40\}\>\|^ref: ' |]],
            [[setf git | endif]],
        }),
    },
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
    { "FileType", "fish", [[set commentstring=#\ %s]] },
    { "TermOpen", "term://*", "setf terminal" },
    { "TermOpen", "term://*", "startinsert" },
    { "TermOpen", "term://*", "setlocal nonumber norelativenumber" },
    { "TermClose", "term://*", "bd!" },
})

augroup("misc", {
    { "WinEnter", "*", "set cursorline" },
    { "WinLeave", "*", "set nocursorline" },
    {
        "BufEnter",
        [[*.png,*.jpg,*.gif]],
        [[exec "silent !open ".expand("%") | :bw]],
    },
    { "FocusLost", "*", [[silent! wa]] }, -- auto save when nvim focus
    { "BufWritePre", "*", [[%s/\s\+$//e]] }, -- remove trailing whitespaces
    { "BufWritePre", "*", [[%s/\n\+\%$//e]] },
    { "FileType", "help", [[wincmd L]] },
})
