vim.api.nvim_create_user_command(
    "FN",
    "let @*=join([expand('%'), line('.'), col('.')], ':')",
    { force = true, nargs = 0 }
)
vim.api.nvim_create_user_command(
    "AFN",
    "let @*=join([expand('%:p'), line('.'), col('.')], ':')",
    { force = true, nargs = 0 }
)
