vim.g.mapleader = " "

map("n|<Space>", "")
map("x|<Space>", "")
map("n|<Esc>", ":noh<cr>:echo<cr><esc>")
map("n|q", "")
map("n|Q", "q")
map("n|<C-q>", "")
map("n|H", "^")
map("v|H", "^")
map("n|L", "$")
map("v|L", "g_")
map("n|n", "'Nn'[v:searchforward]", { expr = true })
map("n|N", "'nN'[v:searchforward]", { expr = true })
map("n|k", [[(v:count == 0 ? 'gk' : 'k')]], { expr = true })
map("n|j", [[(v:count == 0 ? 'gj' : 'j')]], { expr = true })
map([[n|\s]], ":%s//g<left><left>", { silent = false })

map("n|<leader>d", '"_d')
map("v|<leader>d", '"_d')
map("n|<leader>p", '"_dP')
map("n|<leader>x", "0d$")
map("n|<leader><bs>", '"_dd')
map("n|<C-s>", [[empty(expand('%:t')) ? ":w\<Space>" : ":w\<CR>"]], { expr = true })
map("n|<C-q><C-g>", [[:lua searching_google(vim.fn.expand("<cword>"))<CR>]])
map("v|<C-q><C-g>", [[<ESC>gv"gy<ESC>:lua searching_google(vim.fn.getreg('g'))<CR>]])

map("i|<C-a>", "<C-o>^")
map("c|<C-a>", "<HOME>")
map("!|<C-b>", "<Left>")
map("!|<C-d>", "<Del>")
map("!|<C-e>", "<END>")
map("!|<C-f>", "<Right>")
map("!|<C-h>", "<BS>")
map("i|<C-k>", "<C-o>d$")
map("i|<C-u>", "<C-o>d^")
map("!|<C-v>", "<C-r>*")
map("i|,", ",<C-g>u")
map("i|.", ".<C-g>u")
map("i|!", "!<C-g>u")
map("i|?", "?<C-g>u")

map("n|<C-h>", "<C-w>h")
map("n|<C-j>", "<C-w>j")
map("n|<C-k>", "<C-w>k")
map("n|<C-l>", "<C-w>l")
map_cmd("n|<C-w><up>", "res +5")
map_cmd("n|<C-w><down>", "res -5")
map_cmd("n|<C-w><right>", "vertical resize +5")
map_cmd("n|<C-w><left>", "vertical resize -5")
map_cmd("n|<C-w>l", "vnew +terminal | setlocal nobuflisted")
map_cmd("n|<C-w>x", "10new +terminal | setlocal nobuflisted")
map_cmd("n|<C-w>t", "terminal")
map_cmd("n|<C-w>g", "tabe | term lazygit")

map("n|]w", "g*")
map("n|[w", "g#")
map("v|]w", "g*")
map("v|[w", "g#")
map_cmd("n|]q", "cnext")
map_cmd("n|[q", "cprev")
map_cmd("n|<bs>q", "cclose")
map_cmd("n|]Q", "lnext")
map_cmd("n|[Q", "lprev")

map("v|<", "<gv")
map("v|>", ">gv")
map("n|<", "<<")
map("n|>", ">>")

map("n|<A-k>", ":m .-2<CR>==")
map("n|<A-j>", ":m .+1<CR>==")
map("i|<A-k>", "<Esc>:m .-2<CR>==gi")
map("i|<A-j>", "<Esc>:m .+1<CR>==gi")
map("v|<A-k>", ":m '<-2<CR>gv=gv")
map("v|<A-j>", ":m '>+1<CR>gv=gv")

map("t|<Esc><Esc>", [[<C-\><C-N>]])

vim.cmd "command! -bang -nargs=* -complete=file E e<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file W w<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file Wq wq<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file WQ wq<bang> <args>"
vim.cmd "command! -bang Wa wa<bang>"
vim.cmd "command! -bang WA wa<bang>"
vim.cmd "command! -bang Q q<bang>"
vim.cmd "command! -bang QA qa<bang>"
vim.cmd "command! -bang Qa qa<bang>"
