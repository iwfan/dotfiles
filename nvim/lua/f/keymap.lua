vim.g.mapleader = " "

vim.keymap.set("n", "k", [[(v:count == 0 ? 'gk' : 'k')]], { expr = true })
vim.keymap.set("n", "j", [[(v:count == 0 ? 'gj' : 'j')]], { expr = true })

vim.keymap.set({ "n", "v", "o" }, "H", "^")
vim.keymap.set({ "n", "v", "o" }, "L", "g_")
vim.keymap.set({ "n", "v", "o" }, "M", "%")
vim.keymap.set({ "n", "v", "o" }, "]w", "g*")
vim.keymap.set({ "n", "v", "o" }, "[w", "g#")

vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")

vim.keymap.set("n", "q", "")
vim.keymap.set("n", "gq", "q")
vim.keymap.set("n", "<esc>", "<cmd>noh<cr><esc>")
vim.keymap.set("n", "<space><bs>", '"_dd')

vim.keymap.set("i", "<C-a>", "<C-o>^")
vim.keymap.set("c", "<C-a>", "<HOME>")
vim.keymap.set("!", "<C-b>", "<Left>")
vim.keymap.set("!", "<C-e>", "<END>")
vim.keymap.set("!", "<C-f>", "<Right>")
vim.keymap.set("!", "<C-v>", "<C-r>*")
vim.keymap.set("!", '<C-.>', '<S-Right>')
vim.keymap.set("!", '<C-,>', '<S-Left>')
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

vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("n", "<", "<<")
vim.keymap.set("n", ">", ">>")

vim.keymap.set("x", "<c-k>", ":move '<-2<CR>gv-gv")
vim.keymap.set("x", "<c-j>", ":move '>+1<CR>gv-gv")

vim.keymap.set("n", "\\q", "<cmd>copen<cr>")
vim.keymap.set("n", "<bs>q", "<cmd>cclose<cr>")

vim.keymap.set("n", "<C-q>o", [[:lua searching_google(vim.fn.expand("<cword>"))<CR>]])
vim.keymap.set("n", "<C-q>t", [[:lua searching_deepl(vim.fn.expand("<cword>"))<CR>]])
vim.keymap.set("v", "<C-q>o", [[<ESC>gv"gy<ESC>:lua searching_google(vim.fn.getreg('g'))<CR>]])
