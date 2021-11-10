augroup("misc", {
    { "TermOpen", "term://*", "startinsert" },
    { "TermOpen", "term://*", "setl nonumber norelativenumber signcolumn=no" },
    { "TermClose", "term://*", [[if &filetype == 'term' | bd! | else | stopinsert | endif]] },
    { "FocusLost", "*", [[silent! wa]] }, -- auto save when nvim focus
    { "BufWritePre", "*", [[%s/\s\+$//e]] }, -- remove trailing whitespaces
    { "BufWritePre", "*", [[%s/\n\+\%$//e]] },
    {
        "BufEnter",
        [[*.png,*.jpg,*.gif]],
        [[exec "silent !open ".expand("%")]],
    },
})
