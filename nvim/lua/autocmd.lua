augroup("options", {
    { "BufWinEnter,BufRead,BufNewFile", "*", "set formatoptions-=cro formatoptions+=j1" },
})

augroup("yank_highlight", {
    { "TextYankPost", "*", [[silent! lua vim.highlight.on_yank() {higroup="IncSearch", timeout=400}]] },
})

augroup("misc", {
    { "BufWritePre", "*", [[%s/\s\+$//e]] }, -- remove trailing whitespaces
    { "BufWritePre", "*", [[%s/\n\+\%$//e]] },
})
