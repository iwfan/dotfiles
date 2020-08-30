" =========================
" === KeyMappings Setup ===
" =========================

let mapleader = " "
" map CapsLock Escape

map s <nop>
map <C-s> :w<CR>
map <leader>q :x<CR>

"map R :w<cr>:source $MYVIMRC<cr>

noremap n nzz
noremap N Nzz
noremap U <C-r>

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
map <Leader>h g^
map <Leader>l g$
map <leader>H <Plug>(easymotion-linebackward)
map <leader>L <Plug>(easymotion-lineforward)
map <Leader>z :UndotreeToggle<cr>

inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-a> <home>
inoremap <C-e> <end>
inoremap <C-d> <delete>
inoremap <C-s> <Esc>:w<CR>

nnoremap <M-down> :m .+1<CR>==
nnoremap <M-up> :m .-2<CR>==
inoremap <M-down> <Esc>:m .+1<CR>==gi
inoremap <M-up> <Esc>:m .-2<CR>==gi
vnoremap <M-down> :m '>+1<CR>gv=gv
vnoremap <M-up> :m '<-2<CR>gv=gv

" split window
map <leader>sh :set nosplitright<cr>:vsplit<cr>
map <leader>sl :set splitright<cr>:vsplit<cr>
map <leader>sj :set splitbelow<cr>:split<cr>
map <leader>sk :set nosplitbelow<cr>:split<cr>

map <leader>wh <C-w>h
map <leader>wl <C-w>l
map <leader>wj <C-w>j
map <leader>wk <C-w>k

map <C-S-k> w:res +5<cr>
map <C-S-j> :res -5<cr>
map <C-S-h> :vertical resize +5<cr>
map <C-S-l> :vertical resize -5<cr>

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>] :bnext<cr>
map <leader>[ :bprevious<cr>


" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext
"map <leader>] gt
"map <leader>[ gT


" Terminal window navigation
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
tnoremap <Esc> <C-\><C-n>
