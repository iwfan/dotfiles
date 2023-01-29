vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- better up/down
vim.keymap.set("n", "k", [[(v:count == 0 ? 'gk' : 'k')]], { expr = true })
vim.keymap.set("n", "j", [[(v:count == 0 ? 'gj' : 'j')]], { expr = true })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true, desc = "Next search result" })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true, desc = "Prev search result" })

-- Add undo break-points
vim.keymap.set("i", ",", ",<c-g>u")
vim.keymap.set("i", ".", ".<c-g>u")
vim.keymap.set("i", ";", ";<c-g>u")

vim.keymap.set({ "n", "v", "o" }, "H", "^")
vim.keymap.set({ "n", "v", "o" }, "L", "g_")
vim.keymap.set({ "n", "v", "o" }, "M", "%")
vim.keymap.set({ "n", "v", "o" }, "]w", "g*")
vim.keymap.set({ "n", "v", "o" }, "[w", "g#")

vim.keymap.set("n", "q", "")
vim.keymap.set("n", "gq", "q")
vim.keymap.set("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit all" })
vim.keymap.set("n", "<space><bs>", '"_dd')
vim.keymap.set("n", "[<space>", ":<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[")
vim.keymap.set("n", "]<space>", ":<c-u>put =repeat(nr2char(10), v:count1)<cr>")
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

vim.keymap.set("i", "<C-a>", "<C-o>^")
vim.keymap.set("c", "<C-a>", "<HOME>")
vim.keymap.set("!", "<C-b>", "<Left>")
vim.keymap.set("!", "<C-e>", "<END>")
vim.keymap.set("!", "<C-f>", "<Right>")
vim.keymap.set("!", "<C-v>", "<C-r>*")
vim.keymap.set("!", "<C-.>", "<S-Right>")
vim.keymap.set("!", "<C-,>", "<S-Left>")
vim.keymap.set("i", "<S-Tab>", "<BS>")
vim.keymap.set("n", "<C-h>", [[<c-w>h]])
vim.keymap.set("n", "<C-l>", [[<c-w>l]])
vim.keymap.set("n", "<C-j>", [[<c-w>j]])
vim.keymap.set("n", "<C-k>", [[<c-w>k]])
vim.keymap.set("t", "<C-H>", [[<c-\><c-n><c-w>h]])
vim.keymap.set("t", "<C-L>", [[<c-\><c-n><c-w>l]])
vim.keymap.set("t", "<C-J>", [[<c-\><c-n><c-w>j]])
vim.keymap.set("t", "<C-K>", [[<c-\><c-n><c-w>k]])
vim.keymap.set("t", "<C-]>", [[<C-\><C-n>]])
vim.keymap.set({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")

vim.keymap.set("n", "<A-j>", ":m .+1<cr>==", { desc = "Move down" })
vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<cr>==gi", { desc = "Move down" })
vim.keymap.set("n", "<A-k>", ":m .-2<cr>==", { desc = "Move up" })
vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<cr>==gi", { desc = "Move up" })

vim.keymap.set("n", "\\q", "<cmd>copen<cr>")
vim.keymap.set("n", "<bs>q", "<cmd>cclose<cr>")

vim.keymap.set("n", "<C-q>o", [[:lua searching_google(vim.fn.expand("<cword>"))<CR>]])
vim.keymap.set("n", "<C-q>t", [[:lua searching_deepl(vim.fn.expand("<cword>"))<CR>]])
vim.keymap.set("v", "<C-q>o", [[<ESC>gv"gy<ESC>:lua searching_google(vim.fn.getreg('g'))<CR>]])
