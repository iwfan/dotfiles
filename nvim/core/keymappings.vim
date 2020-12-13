
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <SPACE> <Nop>
let mapleader = "\<SPACE>"

nmap s <Nop>
xmap s <Nop>

nnoremap j gj
vnoremap j gj
nnoremap k gk
vnoremap k gk
nnoremap L g$
nnoremap H g^
vnoremap L g$
vnoremap H g^
nnoremap m g%
vnoremap m g%

" Disable Ex-mode.
nnoremap Q  q
nnoremap q <nop>

" Better indenting
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>

" Command-line mode keymappings:
" <C-a>, A: move to head.
cnoremap <C-a>          <Home>
inoremap <C-a>          <Home>
" <C-b>: previous char.
cnoremap <C-b>          <Left>
inoremap <C-b>          <Left>
" <C-d>: delete char.
cnoremap <C-d>          <Del>
inoremap <C-d>          <Del>
" <C-e>, E: move to end.
cnoremap <C-e>          <End>
inoremap <C-e>          <End>
" <C-f>: next char.
cnoremap <C-f>          <Right>
inoremap <C-f>          <Right>
" <C-n>: next history.
cnoremap <C-n>          <Down>
inoremap <C-n>          <Down>
" <C-p>: previous history.
cnoremap <C-p>          <Up>
inoremap <C-p>          <Up>
" <C-y>: paste.
cnoremap <C-y>          <C-r>*
inoremap <C-y>          <C-r>*
" <C-c>: S.
nmap <expr> <C-s> empty(expand('%:t')) ? ":w\<Space>" : ":w\<CR>"
inoremap <expr> <c-s> empty(expand('%:t')) ? "\<Esc>:w\<Space>" : "<Esc>:w\<CR>"

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" Use control-c instead of escape
nnoremap <C-c> <Esc>
vnoremap <C-c> <Esc>

nnoremap <leader><backspace> "_dd

nnoremap <leader>I O<Esc>
nnoremap <leader>i o<Esc>
nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

nnoremap <silent><bs>b <esc>:bd<cr>
vnoremap <silent><bs>b <esc>:bd<cr>

nnoremap <silent> \tn :tabe<CR>
nnoremap <silent> \tv :vnew<CR>
nnoremap <silent> \to :tabonly<cr>
nnoremap <silent> \tq :tabclose<cr>
nnoremap <silent> \tm :tabmove

" split window
nmap <leader>\ :set splitright<cr>:vsplit<cr>
nmap <leader>- :set splitbelow<cr>:split<cr>
nmap <C-h> <C-w>h
nmap <C-l> <C-w>l
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k

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
" If press l on fold, fold open.
nnoremap <expr> l foldclosed(line('.')) != -1 ? 'zo0' : 'l'
" If press l on fold, range fold open.
xnoremap <expr> l foldclosed(line('.')) != -1 ? 'zogv0' : 'l'

map <F1> :edit $HOME/.config/nvim/init.vim<CR>
map <F2> :source $HOME/.config/nvim/init.vim<CR>
map <F3> :PlugInstall<CR>
map <F4> :PlugUpdate<CR>

