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

vim.api.nvim_create_user_command("H", function(args)
    vim.cmd("vert h " .. args.args)
end, { nargs = 1, complete = "help" })
