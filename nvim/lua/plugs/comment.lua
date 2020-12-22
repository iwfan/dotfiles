vim.api.nvim_set_var('tcomment_maps', 0)

vim.api.nvim_set_keymap('x', 'gc', '<Plug>TComment_gc', { silent = true })
vim.api.nvim_set_keymap('n', 'gc', '<Plug>TComment_gc', { silent = true })
vim.api.nvim_set_keymap('o', 'gc', '<Plug>TComment_gc', { silent = true })

vim.api.nvim_set_keymap('x', 'gcb', '<Plug>TComment_gcb', { silent = true })
vim.api.nvim_set_keymap('n', 'gcb', '<Plug>TComment_gcb', { silent = true })
vim.api.nvim_set_keymap('o', 'gcb', '<Plug>TComment_gcb', { silent = true })

vim.api.nvim_set_keymap('x', 'gcc', '<Plug>TComment_gcc', { silent = true })
vim.api.nvim_set_keymap('n', 'gcc', '<Plug>TComment_gcc', { silent = true })
vim.api.nvim_set_keymap('o', 'gcc', '<Plug>TComment_gcc', { silent = true })

vim.api.nvim_set_keymap('', '<C-_>', ':TComment<cr>', { silent = true })
vim.api.nvim_set_keymap('i', '<C-_>', '<C-o>:TComment<cr>', { silent = true })
