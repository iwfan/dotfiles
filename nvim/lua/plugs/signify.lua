vim.api.nvim_set_var('signify_sign_add', '▋')
vim.api.nvim_set_var('signify_sign_change', '▋')
vim.api.nvim_set_var('signify_sign_delete', '▋')
vim.api.nvim_set_var('signify_sign_delete_first_line', '▘')
vim.api.nvim_set_var('signify_sign_show_count', 0)

vim.api.nvim_set_keymap('n', '<leader>gd', ':SignifyDiff<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '\c', ':SignifyHunkDiff<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Del>\c', ':SignifyHunkUndo<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', ']c', '<plug>(signify-next-hunk)', { noremap = false })
vim.api.nvim_set_keymap('n', '[c', '<plug>(signify-prev-hunk)', { noremap = false })

vim.api.nvim_set_keymap('o', 'ic', '<plug>(signify-motion-inner-pending)', { noremap = false })
vim.api.nvim_set_keymap('x', 'ic', '<plug>(signify-motion-inner-visual)', { noremap = false })
vim.api.nvim_set_keymap('o', 'ac', '<plug>(signify-motion-outer-pending)', { noremap = false })
vim.api.nvim_set_keymap('x', 'ac', '<plug>(signify-motion-outer-visual)', { noremap = false })
