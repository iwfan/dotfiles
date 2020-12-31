vim.api.nvim_set_keymap('n', '[b', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', ']b', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'b<', ':BufferLineMovePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'b>', ':BufferLineMoveNext<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', 'gb', ':BufferLinePick<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<BS>b', ':Bdelete<CR>', { noremap = true, silent = true })
