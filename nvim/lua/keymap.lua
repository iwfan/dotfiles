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
map("i|<C-s>", "<C-o><cmd>w<cr>")
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

map("n|<M-a>", ":echo '<M-a> key !!!'<CR>")
map("n|<M-b>", ":echo '<M-b> key !!!'<CR>")
-- map("n|<M-c>", ":echo '<M-c> key !!!'<CR>")
map("n|<M-d>", ":echo '<M-d> key !!!'<CR>")
-- map("n|<M-e>", ":echo '<M-e> key !!!'<CR>")
map("n|<M-f>", ":echo '<M-f> key !!!'<CR>")
map("n|<M-g>", ":echo '<M-g> key !!!'<CR>")
-- map("n|<M-h>", ":echo '<M-h> key !!!'<CR>")
map("n|<M-i>", ":echo '<M-i> key !!!'<CR>")
map("n|<M-j>", ":echo '<M-j> key !!!'<CR>")
map("n|<M-k>", ":echo '<M-k> key !!!'<CR>")
map("n|<M-l>", ":echo '<M-l> key !!!'<CR>")
-- map("n|<M-m>", ":echo '<M-m> key !!!'<CR>")
-- map("n|<M-n>", ":echo '<M-n> key !!!'<CR>")
-- map("n|<M-o>", ":echo '<M-o> key !!!'<CR>")
-- map("n|<M-p>", ":echo '<M-p> key !!!'<CR>")
-- map("n|<M-q>", ":echo '<M-q> key !!!'<CR>")
-- map("n|<M-r>", ":echo '<M-r> key !!!'<CR>")
map("n|<M-s>", ":echo '<M-s> key !!!'<CR>")
-- map("n|<M-t>", ":echo '<M-t> key !!!'<CR>")
map("n|<M-u>", ":echo '<M-u> key !!!'<CR>")
-- map("n|<M-v>", ":echo '<M-v> key !!!'<CR>")
-- map("n|<M-w>", ":echo '<M-w> key !!!'<CR>")
map("n|<M-x>", ":echo '<M-x> key !!!'<CR>")
map("n|<M-y>", ":echo '<M-y> key !!!'<CR>")
map("n|<M-z>", ":echo '<M-z> key !!!'<CR>")

map("n|C<Enter>", ":echo '<Ctrl-Enter> key !!!'<CR>")
map("n|S<Enter>", ":echo '<Shift-Enter> key !!!'<CR>")
map("n|C-S<Enter>", ":echo '<Ctrl-Shift-Enter> key !!!'<CR>")

map("n|<M-'>", [[:echo "<M-'> key !!!"<CR>]])
map("n|<M-]>", ":echo '<M-]> key !!!'<CR>")
map("n|<M-[>", ":echo '<M-[> key !!!'<CR>")

vim.cmd "command! -bang -nargs=* -complete=file E e<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file W w<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file Wq wq<bang> <args>"
vim.cmd "command! -bang -nargs=* -complete=file WQ wq<bang> <args>"
vim.cmd "command! -bang Wa wa<bang>"
vim.cmd "command! -bang WA wa<bang>"
vim.cmd "command! -bang Q q<bang>"
vim.cmd "command! -bang QA qa<bang>"
vim.cmd "command! -bang Qa qa<bang>"
