vim.g.mapleader = " "

map("n|<Space>", "")
map("x|<Space>", "")
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

map("i|<C-a>", "<C-o>^")
map("c|<C-a>", "<HOME>")
map("!|<C-b>", "<Left>")
map("!|<C-e>", "<END>")
map("!|<C-f>", "<Right>")
map("i|<C-k>", "<C-o>dg_")
map("i|<C-u>", "<C-o>d^")
map("!|<C-v>", "<C-r>*")
map("i|<S-Tab>", "<bs>")
map("i|,", ",<C-g>u")
map("i|.", ".<C-g>u")
map("i|!", "!<C-g>u")
map("i|?", "?<C-g>u")

map("t|<C-H>", [[<c-\><c-n><c-w>h]])
map("t|<C-L>", [[<c-\><c-n><c-w>l]])
map("t|<C-J>", [[<c-\><c-n><c-w>j]])
map("t|<C-K>", [[<c-\><c-n><c-w>k]])
map("t|<C-_>", [[<C-\><C-N>]])

map("n|<C-h>", [[<c-w>h]])
map("n|<C-l>", [[<c-w>l]])
map("n|<C-j>", [[<c-w>j]])
map("n|<C-k>", [[<c-w>k]])
map_cmd("n|<C-w><up>", "res +5")
map_cmd("n|<C-w><down>", "res -5")
map_cmd("n|<C-w><right>", "vertical resize +5")
map_cmd("n|<C-w><left>", "vertical resize -5")

map_cmd("n|<C-w>t", "vnew +term | setlocal nobuflisted ft=term")
map_cmd("n|<C-w>b", "10new +term | setlocal nobuflisted ft=term")
map_cmd("n|<C-w>g", "tabe +term=lazygit | setlocal ft=term")

map("n|<leader><bs>", '"_dd')
map("n|<Esc>", ":noh<cr>:echo<cr><esc>")
map("n|<C-s>", [[empty(expand('%:t')) ? ":w\<Space>" : ":w\<CR>"]], { expr = true })
map("n|<C-g>s", [[:lua searching_google(vim.fn.expand("<cword>"))<CR>]])
map("v|<C-g>s", [[<ESC>gv"gy<ESC>:lua searching_google(vim.fn.getreg('g'))<CR>]])

map("n|]w", "g*")
map("n|[w", "g#")
map("v|]w", "g*")
map("v|[w", "g#")

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

vim.cmd "command! -bang -nargs=* -complete=file E e<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file W w<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file Wq wq<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file WQ wq<bang> <args>"
vim.cmd "command! -bang Wa wa<bang>"
vim.cmd "command! -bang WA wa<bang>"
vim.cmd "command! -bang Q q<bang>"
vim.cmd "command! -bang QA qa<bang>"
vim.cmd "command! -bang Qa qa<bang>"
