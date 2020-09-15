
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Caution: Mapping should place before PluginConfigure

nmap <SPACE> <Nop>
let mapleader = "\<SPACE>"

" map CapsLock to Escape
inoremap jk <Esc>
inoremap kj <Esc>
vnoremap jk <Esc>
vnoremap kj <Esc>
" Use control-c instead of escape
nnoremap <C-c> <Esc>

nmap . .`[
nmap s <nop>
nmap <silent> <C-s> :w<CR>
nmap <silent> <C-q> :q<CR>

noremap U <C-r>

" Better indenting
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>

inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-a> <home>
inoremap <C-e> <end>
inoremap <C-d> <delete>
inoremap <C-s> <Esc>:w<CR>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>


nnoremap <leader><backspace> "_dd
nnoremap <leader>m %

nnoremap <leader>I O<Esc>
nnoremap <leader>i o<Esc>
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" Close all the buffers
nnoremap <silent><TAB> <esc>:bnext<cr>
nnoremap <silent><S-TAB> <esc>:bprevious<cr>
vnoremap <silent><TAB> <esc>:bnext<cr>
vnoremap <silent><S-TAB> <esc>:bprevious<cr>

" Useful mappings for managing tabs
nnoremap <silent> <leader>tn :tabe<CR>
nnoremap <silent> <leader>tv :vnew<CR>
nnoremap <silent> <leader>th :-tabnext<CR>
nnoremap <silent> <leader>tl :+tabnext<CR>
nnoremap <silent> <leader>to :tabonly<cr>
nnoremap <silent> <leader>tq :tabclose<cr>
nnoremap <silent> <leader>tm :tabmove

" split window
nmap <leader>\ :set splitright<cr>:vsplit<cr>
nmap <leader>\| :set splitbelow<cr>:split<cr>
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k

nmap <C-S-up> :res +5<cr>
nmap <C-S-down> :res -5<cr>
nmap <C-S-left> :vertical resize +5<cr>
nmap <C-S-right> :vertical resize -5<cr>

" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

" use option/alt + ↑/↓  to change line
nnoremap <silent> <M-down> :m .+1<CR>==
nnoremap <silent> <M-up> :m .-2<CR>==
inoremap <silent> <M-down> <Esc>:m .+1<CR>==gi
inoremap <silent> <M-up> <Esc>:m .-2<CR>==gi
vnoremap <silent> <M-down> :m '>+1<CR>gv=gv
vnoremap <silent> <M-up> :m '<-2<CR>gv=gv

" use <++> as placeholder
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>j4d

map <F1> :edit $HOME/.config/nvim/init.vim<CR>
map <F2> :source $HOME/.config/nvim/init.vim<CR>
map <F3> :PlugInstall<CR>
map <F4> :PlugUpdate<CR>

