" =========================
" === KeyMappings Setup ===
" =========================

let mapleader = " "
" map CapsLock Escape

map s <nop>
map <C-s> :noh<CR>:w<CR>
map <C-q> :x<CR>

"map R :w<cr>:source $MYVIMRC<cr>

noremap n nzz
noremap N Nzz
noremap U <C-r>

noremap H g^
noremap L g$
noremap J <C-d>zz
noremap K <C-u>zz
noremap <C-d> j
noremap <C-u> k

noremap ]w g*zz
noremap [w g#zz

" Better indenting
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>

map <leader><backspace> "_dd
map <leader>m %
map <leader>n :noh<CR>
nnoremap <leader>i o<Esc>
nnoremap <leader>I O<Esc>
" Easy motion search
map <leader>f <Plug>(easymotion-sn)
map <leader>F <Plug>(easymotion-tn)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <leader>h <Plug>(easymotion-linebackward)
map <leader>l <Plug>(easymotion-lineforward)
map <Leader>z :UndotreeToggle<cr>

inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-a> <home>
inoremap <C-e> <end>
inoremap <C-d> <delete>
inoremap <C-s> <Esc>:w<CR>

nnoremap <silent> <M-down> :m .+1<CR>==
nnoremap <silent> <M-up> :m .-2<CR>==
inoremap <silent> <M-down> <Esc>:m .+1<CR>==gi
inoremap <silent> <M-up> <Esc>:m .-2<CR>==gi
vnoremap <silent> <M-down> :m '>+1<CR>gv=gv
vnoremap <silent> <M-up> :m '<-2<CR>gv=gv

" split window
map <leader>sh :set nosplitright<cr>:vsplit<cr>
map <leader>sl :set splitright<cr>:vsplit<cr>
map <leader>sj :set splitbelow<cr>:split<cr>
map <leader>sk :set nosplitbelow<cr>:split<cr>

map <leader>wh <C-w>h
map <leader>wl <C-w>l
map <leader>wj <C-w>j
map <leader>wk <C-w>k


map <C-S-up> :res +5<cr>
map <C-S-down> :res -5<cr>
map <C-S-left> :vertical resize +5<cr>
map <C-S-right> :vertical resize -5<cr>

" Close all the buffers
noremap <silent> bd :bd<cr>
noremap <silent> bl :bnext<cr>
noremap <silent> bh :bprevious<cr>
noremap <silent> bH :bfirst<cr>
noremap <silent> bL :blast<cr>

" Useful mappings for managing tabs
noremap <silent> tn :tabe<CR>
noremap <silent> th :-tabnext<CR>
noremap <silent> tl :+tabnext<CR>
noremap <silent> to :tabonly<cr>
noremap <silent> tc :tabclose<cr>
noremap <silent> tm :tabmove
"map <leader>] gt
"map <leader>[ gT


" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>

map <LEADER>sc :set spell!<CR>
map <LEADER><LEADER> <ESC>/<++><CR>:nohlsearch<CR>j4d

vnoremap <C-c> "+y

map <F1> :edit ~/.config/nvim/init.vim<CR>
map <F2> :source ~/.config/nvim/init.vim<CR>
map <F3> :PlugInstall<CR>
map <F4> :PlugUpdate<CR>
