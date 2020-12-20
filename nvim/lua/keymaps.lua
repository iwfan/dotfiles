vim.g.mapleader = ' '

vim.api.nvim_set_keymap('n', ' ', '', { noremap = true })
vim.api.nvim_set_keymap('x', ' ', '', { noremap = true })

vim.api.nvim_set_keymap('n', 'q', '', { noremap = true })
vim.api.nvim_set_keymap('n', 'Q', 'q', { noremap = true })

vim.api.nvim_set_keymap('i', '<C-a>', '<C-o>^', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-a>', '<HOME>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-b>', '<Left>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-d>', '<Del>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-e>', '<END>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-f>', '<Right>', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-h>', '<BS>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-k>', '<C-o>d$', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-s>', [[empty(expand("%:t")) ? "\<C-o>:w\<Space>" : "<C-o>:w\<CR>"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap('n', '<C-s>', [[empty(expand('%:t')) ? ":w\<Space>" : ":w\<CR>"]], { noremap = true, expr = true })
vim.api.nvim_set_keymap('i', '<C-u>', '<C-o>d^', { noremap = true })
vim.api.nvim_set_keymap('!', '<C-y>', '<C-r>*', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-z>', '<C-o>u', { noremap = true })
vim.api.nvim_set_keymap('c', '<C-t>', [[<C-R>=expand("%:p:h") . "/" <CR>]], { noremap = true })
