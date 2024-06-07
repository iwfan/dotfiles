vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.wxml"},
    command = "set ft=html",
})

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
    pattern = {"*.wxss"},
    command = "set ft=css",
})
