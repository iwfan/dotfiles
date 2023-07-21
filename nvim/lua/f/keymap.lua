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
vim.keymap.set("i", "<C-a>", "<C-o>^")
vim.keymap.set("c", "<C-a>", "<HOME>")
vim.keymap.set("!", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-d>", "<DEL>")
vim.keymap.set("!", "<C-e>", "<END>")
vim.keymap.set("i", "<C-l>", [[(&spell == 0 ? '' : '<c-g>u<Esc>[s1z=`]a<c-g>u')]], { expr = true })
vim.keymap.set("!", "<C-f>", "<Right>")
vim.keymap.set("i", "<C-p>", "<Up>")
vim.keymap.set("i", "<C-n>", "<Down>")
vim.keymap.set("!", "<C-v>", "<C-r>*")
vim.keymap.set("!", "<C-k>", '<C-o>"_d$')
vim.keymap.set("!", "<M-f>", "<S-Right>")
vim.keymap.set("!", "<M-b>", "<S-Left>")
vim.keymap.set("i", "<C-s>", "<c-g>u<C-o><cmd>w<CR><ESC>", { desc = "Save file" })
vim.keymap.set("n", "<C-s>", "<cmd>w<CR><ESC>", { desc = "Save file" })
vim.keymap.set("i", "<S-Tab>", "<BS>")

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

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
vim.keymap.set("n", "<C-w>t", [[<cmd>vsplit term://fish<CR>]])
vim.keymap.set("n", "<C-w>b", [[<cmd>split term://fish<CR>]])
vim.keymap.set("n", "<M-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
vim.keymap.set("n", "<M-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
vim.keymap.set("n", "<M-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
vim.keymap.set("n", "<M-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- for short finger
vim.keymap.set({ "n", "v", "o" }, "H", "^")
vim.keymap.set({ "n", "v", "o" }, "L", "g_")

-- misc
vim.keymap.set("n", "q", "<Nop>")
vim.keymap.set("n", "Q", "q")
vim.keymap.set("n", "gq", "<Nop>")
vim.keymap.set("n", "gQ", "Q")
vim.keymap.set("n", "<esc>", "<esc><cmd>noh<CR><cmd>call feedkeys(':','nx')<CR>", { desc = "Clear all" })
vim.keymap.set("x", "p", [[p:let @+=@0<CR>:let @"=@0<CR>]], { desc = "Dont copy replaced text" })
vim.keymap.set("n", "<space>qq", "<cmd>qa<CR>", { desc = "Quit all" })
vim.keymap.set("n", "<space><bs>", [["_dd]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<CR>'[", { silent = true })
vim.keymap.set("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<CR>", { silent = true })

vim.keymap.set("n", "<Bslash>q", ":<c-u>copen<CR>")
vim.keymap.set("n", "<BS>q", ":<c-u>cclose<CR>")
