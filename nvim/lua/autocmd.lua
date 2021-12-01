augroup("options", {
    { "BufWinEnter,BufRead,BufNewFile", "*", "set formatoptions-=cro formatoptions+=j1" },
})

augroup("yank_highlight", {
    { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] },
})

augroup("term", {
    { "TermOpen", "term://*", "startinsert" },
    { "TermOpen", "term://*", "setl nonumber norelativenumber signcolumn=no" },
    { "TermClose", "term://*", [[if &filetype == 'term' | bd! | else | stopinsert | endif]] },
})

augroup("misc", {
    { "FocusLost", "*", [[silent! wa]] }, -- auto save when nvim focus
    { "BufWritePre", "*", [[%s/\s\+$//e]] }, -- remove trailing whitespaces
    { "BufWritePre", "*", [[%s/\n\+\%$//e]] },
})
