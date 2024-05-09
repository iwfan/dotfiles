vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better up/down
vim.keymap.set("n", "k", [[(v:count == 0 ? 'gk' : 'k')]], { expr = true, silent = true })
vim.keymap.set("n", "j", [[(v:count == 0 ? 'gj' : 'j')]], { expr = true, silent = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Emacs-like keybinding for insert mode
vim.keymap.set("i", "<C-a>", "<C-o>^", { desc = "Jump to first non-blank character of current line" })
vim.keymap.set("i", "<C-e>", "<C-o>$", { desc = "Jump to last non-blank character of current line" })
vim.keymap.set("i", "<C-b>", "<Left>", { desc = "Move backward" })
vim.keymap.set("i", "<C-f>", "<Right>", { desc = "Move forward" })
vim.keymap.set("i", "<C-p>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-n>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-h>", "<BS>", { desc = "Backspace" })
vim.keymap.set("i", "<C-d>", "<Del>", { desc = "Delete" })
vim.keymap.set("i", "<C-v>", "<C-r>*", { desc = "Paste from system clipboard" })
vim.keymap.set("i", "<C-k>", '<C-o>"_d$', { desc = "Kill characters after cusor"})
vim.keymap.set("i", "<C-z>", '<C-o><Cmd>undo<CR>', { desc = "Kill characters after cusor"})
vim.keymap.set("i", "<S-Tab>", "<BS>", { desc = "Backspace" })
vim.keymap.set("i", "<C-l>", [[(&spell == 0 ? '' : '<c-g>u<Esc>[s1z=`]a<c-g>u')]], { expr = true, desc = "Spelling correction" })
vim.keymap.set("i", "<C-s>", "<c-g>u<C-o><Cmd>w<CR><ESC>", { desc = "Save file" })
-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

-- Emacs-like keybinding for command-line mode
vim.keymap.set("c", "<C-a>", "<Home>", { desc = "Jump to line start"})
vim.keymap.set("c", "<C-e>", "<End>", { desc = "Jump to line end"})
vim.keymap.set("c", "<C-h>", "<BS>", { desc = "Backspace" })
vim.keymap.set("c", "<C-d>", "<Del>", { desc = "Delete" })
vim.keymap.set("c", "<C-v>", "<C-r>*", { desc = "Paste from system clipboard" })

-- Emacs-like keybinding for normal mode
-- for short finger
vim.keymap.set({ "n", "v", "o" }, "H", "^")
vim.keymap.set({ "n", "v", "o" }, "L", "g_")
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR><ESC>", { desc = "Save file" })

-- Move line Up / Down
vim.keymap.set('n', '<M-j>', ':move .+1<CR>==', { silent = true })
vim.keymap.set('n', '<M-k>', ':move .-2<CR>==', { silent = true })
vim.keymap.set('x', '<M-j>', ":move '>+1<CR>gv-gv", { silent = true })
vim.keymap.set('x', '<M-k>', ":move '<-2<CR>gv-gv", { silent = true })

vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- window management
vim.keymap.set("n", "<C-h>", [[<c-w>h]])
vim.keymap.set("n", "<C-l>", [[<c-w>l]])
vim.keymap.set("n", "<C-j>", [[<c-w>j]])
vim.keymap.set("n", "<C-k>", [[<c-w>k]])
vim.keymap.set("t", "<C-H>", [[<c-\><c-n><c-w>h]])
vim.keymap.set("t", "<C-L>", [[<c-\><c-n><c-w>l]])
vim.keymap.set("t", "<C-J>", [[<c-\><c-n><c-w>j]])
vim.keymap.set("t", "<C-K>", [[<c-\><c-n><c-w>k]])
vim.keymap.set("t", "<C-]>", [[<C-\><C-n>]])
vim.keymap.set("n", "<C-w>t", [[<Cmd>50vsplit term://fish<CR>]])
vim.keymap.set("n", "<C-w>b", [[<Cmd>20split term://fish<CR>]])
vim.keymap.set("n", "<M-Up>", "<Cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<M-Down>", "<Cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<M-Left>", "<Cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<M-Right>", "<Cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- misc
vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "gq", "<Nop>", { desc = "Do not open operation mode" })
vim.keymap.set("n", "gQ", "Q", { desc = "Do not open Ex mode" })
vim.keymap.set("n", "<esc>", "<esc><Cmd>noh<CR><Cmd>call feedkeys(':','nx')<CR>", { desc = "Clear all" })
vim.keymap.set("x", "p", [[p:let @+=@0<CR>:let @"=@0<CR>]], { desc = "Dont copy replaced text" })
vim.keymap.set("n", "qr", [[:%s/<C-r><C-w>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<space><bs>", [["_dd]])
vim.keymap.set("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[", { silent = true })
vim.keymap.set("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<CR>", { silent = true })

vim.keymap.set("n", "<C-q>", "<Nop>")
vim.keymap.set("n", "<C-y>", "<Nop>")
vim.keymap.set("n", "<C-t>", "<Nop>")
vim.keymap.set("n", "<C-;>", ":echo 1<cr>")
vim.keymap.set("n", "<C-'>", ":echo 2<cr>")
vim.keymap.set("n", "<C-,>", ":echo 3<cr>")
vim.keymap.set("n", "<C-.>", ":echo 4<cr>")

