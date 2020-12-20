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

vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-w>}', ':res +5<cr>', { noremap = false })
vim.api.nvim_set_keymap('n', '<C-w>{', ':res -5<cr>', { noremap = false })
vim.api.nvim_set_keymap('n', '<C-w>]', ':vertical resize +5<cr>', { noremap = false })
vim.api.nvim_set_keymap('n', '<C-w>[', ':vertical resize -5<cr>', { noremap = false })

vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true })
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true })
vim.api.nvim_set_keymap('n', '<', '<<', { noremap = true })
vim.api.nvim_set_keymap('n', '>', '>>', { noremap = true })

vim.api.nvim_set_keymap('n', '<leader><backspace>', '"_dd', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', 'g^', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', 'g$', { noremap = true })

vim.api.nvim_set_keymap('n', '<C-S-up>',   ':m .-2<CR>==', { silent = true })
vim.api.nvim_set_keymap('n', '<C-S-down>', ':m .+1<CR>==', { silent = true })
vim.api.nvim_set_keymap('i', '<C-S-up>',   '<Esc>:m .-2<CR>==gi', { silent = true })
vim.api.nvim_set_keymap('i', '<C-S-down>', '<Esc>:m .+1<CR>==gi', { silent = true })
vim.api.nvim_set_keymap('v', '<C-S-up>',   ":m '<-2<CR>gv=gv", { silent = true })
vim.api.nvim_set_keymap('v', '<C-S-down>', ":m '>+1<CR>gv=gv", { silent = true })

vim.api.nvim_set_keymap('t', '<C-h>', [[<C-\><C-N><C-w>h]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-j>', [[<C-\><C-N><C-w>j]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-k>', [[<C-\><C-N><C-w>k]], { noremap = true })
vim.api.nvim_set_keymap('t', '<C-l>', [[<C-\><C-N><C-w>l]], { noremap = true })
vim.api.nvim_set_keymap('t', '<Esc>', [[<C-\><C-n>]], { noremap = true })
