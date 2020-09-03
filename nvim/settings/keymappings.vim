" =========================
" === KeyMappings Setup ===
" =========================

nmap <SPACE> <Nop>
let mapleader = "\<SPACE>"
" map CapsLock Escape

nmap s <nop>
nmap ; :
noremap n nzz
noremap N Nzz
noremap U <C-r>

noremap H g^
noremap L g$
noremap J <C-d>zz
noremap K <C-u>zz
"noremap <C-c> y
"noremap <C-v> p

noremap <C-d> j
noremap <C-u> k

noremap ]w g*zz
noremap [w g#zz

" Better indenting
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>

nmap <silent> <C-s> :noh<CR>:w<CR>
nmap <silent> <C-q> :q<CR>

"map R :w<cr>:source $MYVIMRC<cr>
nmap <leader><backspace> "_dd
nmap <leader>m %
nmap <leader>i o<Esc>
nmap <leader>I O<Esc>
" Easy motion search
"map <leader>f <Plug>(easymotion-sn)
"map <leader>F <Plug>(easymotion-tn)
"map <Leader>j <Plug>(easymotion-j)
"map <Leader>k <Plug>(easymotion-k)
"map <leader>h <Plug>(easymotion-linebackward)
"map <leader>l <Plug>(easymotion-lineforward)

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
nmap <leader>\ :set splitright<cr>:vsplit<cr>
nmap <leader>\| :set splitbelow<cr>:split<cr>
nmap <leader>h <C-w>h
nmap <leader>l <C-w>l
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k

map <C-S-up> :res +5<cr>
map <C-S-down> :res -5<cr>
map <C-S-left> :vertical resize +5<cr>
map <C-S-right> :vertical resize -5<cr>

" Close all the buffers
noremap <silent> ∑ <esc>:bd<cr>
noremap <silent> <M-w> <esc>:bd<cr>
noremap <silent> <leader>] <esc>:bnext<cr>
noremap <silent> <leader>[ <esc>:bprevious<cr>

" Useful mappings for managing tabs
"noremap <silent> tn :tabe<CR>
"noremap <silent> th :-tabnext<CR>
"noremap <silent> tl :+tabnext<CR>
"noremap <silent> to :tabonly<cr>
"noremap <silent> tc :tabclose<cr>
"noremap <silent> tm :tabmove


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

nmap \c <Plug>NERDCommenterToggle

nmap <Leader>g :FloatermNew lazygit<CR>
"nmap <Leader>0 :FloatermNew<CR>
nnoremap <silent> <Leader>0 :FloatermToggle<CR>
tnoremap <silent> <Leader>0 <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <esc><esc> <C-\><C-n>:FloatermKill<CR>

nmap <silent> <Leader>1 <c-u>:CocCommand explorer --toggle<cr>
nmap <silent> <Leader>3 <c-u>:CocCommand explorer --toggle --preset floating<cr>
nmap <silent> <Leader>2 <esc>:Vista<cr>
let g:vista#renderer#enable_icon = 1
let g:vista_disable_statusline = 1
let g:vista_default_executive = 'ctags'
let g:vista_echo_cursor_strategy = 'floating_win'
let g:vista_vimwiki_executive = 'markdown'
let g:vista_executive_for = {
			\ 'vimwiki': 'markdown',
			\ 'pandoc': 'markdown',
			\ 'markdown': 'toc',
			\ 'yaml': 'coc',
			\ 'typescript': 'coc',
			\ 'typescriptreact': 'coc',
			\ }
nmap <silent> <Leader>8 <esc>:UndotreeToggle<cr>
