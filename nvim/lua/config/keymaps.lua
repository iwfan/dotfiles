-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = vim.keycode('<space>')

-- Better vertical movement
vim.keymap.set({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Better search behavior
local search_modes = { 'n', 'x', 'o' }
vim.keymap.set(search_modes, 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next search result' })
vim.keymap.set(search_modes, 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev search result' })

-- Visual mode: extend / shrink selection
vim.keymap.set('v', '<CR>', 'an', { remap = true, desc = 'Extend selection' })
vim.keymap.set('v', '<BS>', 'in', { remap = true, desc = 'Shrink selection' })

-- Buffer switching (normal mode)
vim.keymap.set('n', '<Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<S-Tab>', '<cmd>bprevious<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<leader><Tab>', '<cmd>bdelete<CR>', { desc = 'Close buffer' })

-- Built-in Undotree
vim.cmd.packadd('nvim.undotree')
vim.keymap.set('n', '<leader>u', '<cmd>Undotree<CR>', { desc = 'Toggle Undo Tree' })

-- Built-in Difftool
vim.cmd.packadd('nvim.difftool')
vim.keymap.set('n', '<leader>gd', '<cmd>DiffTool<CR>', { desc = 'Open Diff Tool' })

-- Emacs-style keybindings
local emacs_insert = {
    ['<C-a>'] = { '<C-o>^', 'Move to line start' },
    ['<C-e>'] = { '<C-o>$', 'Move to line end' },
    ['<C-b>'] = { '<Left>', 'Move backward' },
    ['<C-f>'] = { '<Right>', 'Move forward' },
    ['<C-p>'] = { '<Up>', 'Move up' },
    ['<C-n>'] = { '<Down>', 'Move down' },
    ['<C-h>'] = { '<BS>', 'Backspace' },
    ['<C-d>'] = { '<Del>', 'Delete' },
    ['<C-k>'] = { '<C-o>D', 'Kill to end of line' },
    ['<C-z>'] = { '<C-o>u', 'Undo' },
    ['<C-v>'] = { '<C-r>+', 'Paste from clipboard' },
    ['<S-tab>'] = { '<BS>', 'Mapped to backspace' },
}

for key, mapping in pairs(emacs_insert) do
    vim.keymap.set('i', key, mapping[1], { desc = mapping[2] })
end

local emacs_command = {
    ['<C-a>'] = { '<HOME>', 'Move to line start' },
    ['<C-e>'] = { '<END>', 'Move to line end' },
    ['<C-b>'] = { '<Left>', 'Move backward' },
    ['<C-f>'] = { '<Right>', 'Move forward' },
}

for key, mapping in pairs(emacs_command) do
    vim.keymap.set('c', key, mapping[1], { desc = mapping[2] })
end

-- Emacs-like keybinding for normal mode
-- for short finger
vim.keymap.set({ "n", "v", "o" }, "H", "_")
vim.keymap.set({ "n", "v", "o" }, "L", "g_")

-- Move lines up/down
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { silent = true, desc = "Move line down" })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { silent = true, desc = "Move line up" })
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selection down" })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selection up" })

-- Quick save
vim.keymap.set({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv", { desc = "Indent left and reselect" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Comment Line & Block
vim.keymap.set("n", "<C-/>", "gcc", { remap = true, desc = "commentline" })
vim.keymap.set("v", "<C-/>", "gc", { remap = true, desc = "comment visual" })

-- window management
vim.keymap.set("n", "<C-h>", [[<c-w>h]], { desc = "Go to left window" })
vim.keymap.set("n", "<C-l>", [[<c-w>l]], { desc = "Go to right window" })
vim.keymap.set("n", "<C-j>", [[<c-w>j]], { desc = "Go to down window" })
vim.keymap.set("n", "<C-k>", [[<c-w>k]], { desc = "Go to top window" })
vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- Terminal mode navigation
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Terminal left window nav' })
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Terminal down window nav' })
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Terminal up window nav' })
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Terminal right window nav' })
vim.keymap.set('t', '<C-]>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Join line without change cursor position
vim.keymap.set("n", "J", "mzJ`z")
-- paste over selection without loosing yanked
vim.keymap.set("x", "p", [["_dP]])
-- leader d delete wont remember as yanked/clipboard when delete pasting
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])
vim.keymap.set({ "n", "v" }, "<space><bs>", [["_dd]])

-- misc
vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "gq", "<Nop>", { desc = "Do not open operation mode" })
vim.keymap.set("n", "gQ", "Q", { desc = "Do not open Ex mode" })
vim.keymap.set("n", "qr", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[", { silent = true })
vim.keymap.set("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<CR>", { silent = true })

vim.keymap.set('n', '<leader>re', '<cmd>restart<CR>', { desc = 'Restart Neovim' })

-- file manager
vim.keymap.set("n", "<C-t>", "<cmd>Yazi<cr>")
vim.keymap.set("n", "<space>e", "<cmd>Yazi<cr>")
-- lazy git
vim.keymap.set("n", "<C-g>", "<cmd>Lazygit<cr>")

-- Disabled keys
vim.keymap.set("n", "<C-q>", "<Nop>")
vim.keymap.set("n", "<C-y>", "<Nop>")
vim.keymap.set("n", "<C-,>", ":echo 3<cr>")
vim.keymap.set("n", "<C-.>", ":echo 4<cr>")
