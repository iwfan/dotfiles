let g:python_host_prog='/usr/bin/python'
let g:python3_host_prog='/usr/local/opt/python@3.8/bin/python3'

" ===
" === Auto load for first time uses
" ===
if empty(glob('~/.config/nvim/autoload/plug.vim'))
 silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" ====================
" === Editor Setup ===
" ====================

" ===
" === System
" ===
set nocompatible
"set clipboard=unnamedplus
let &t_ut=''
set t_Co=256                    " this fixes colors on OS X terminal
set autochdir
set encoding=utf8
set autoread                    " auto reload files changed outside of vim
set mouse=a
set noswapfile

" disable bells
set noerrorbells
set novisualbell
set noerrorbells
set vb t_vb=

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" ===
" === Editor behavior
" ===
filetype on                     " filetype detection on
filetype plugin on              " load plugins
syntax on                       " use syntax highlighting

set number
set relativenumber
set cursorline
set hidden

set expandtab                   " use spaces instead of evil tabs
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set copyindent

set list
set listchars=tab:\|\ ,trail:▫
set scrolloff=4
set ttimeoutlen=0
set notimeout
set viewoptions=cursor,folds,slash,unix

set wrap                  " Break line at predefined characters
set linebreak             " Character to show before the lines that have been soft-wrapped
set showbreak=↪
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set tw=0
set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc
set splitright
set splitbelow

set showmode
set showcmd
set laststatus=2
set ruler
set wildmenu
set wildignore+=*.swp,*.bak

set hlsearch                " 高亮搜索
set incsearch               " 自动定位到输入中的字符串，不需要回车搜索
set ignorecase              " 搜索时智能匹配大小写
set smartcase
set matchpairs+=<:>,「:」    " %默认匹配()、[]、{}，增加匹配<>
set showmatch               " Show matching brackets when text indicator is over them

set shortmess+=c
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set ttyfast                 "should make scrolling faster
set lazyredraw              "same as above

silent !mkdir -p ~/.config/nvim/tmp/backup
silent !mkdir -p ~/.config/nvim/tmp/undo
"silent !mkdir -p ~/.config/nvim/tmp/sessions
set backupdir=~/.config/nvim/tmp/backup,.
set directory=~/.config/nvim/tmp/backup,.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/nvim/tmp/undo,.
endif
set colorcolumn=100
set updatetime=100
set virtualedit=block
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" ===
" === Plugins
" ===

call plug#begin('~/.vim/plugged')
Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
"Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
call plug#end()


" ===
" === Terminal Behaviors
" ===
let g:neoterm_autoscroll = 1
autocmd TermOpen term://* startinsert
tnoremap <C-q> <C-\><C-N>
tnoremap <C-Q> <C-\><C-N><C-O>


" ===
" === key map
" ===
let mapleader = " "
" map CapsLock Escape

map s <nop>
map S :w<CR>
map Q :x<CR>
map R :w<cr>:source $MYVIMRC<cr>

noremap n nzz
noremap N Nzz
noremap U <C-r>

noremap H ^ " 5b
noremap L & " 5w
noremap J <C-d>zz " 5j
noremap K <C-u>zz " 5k

noremap ]w g*
noremap [w g#

inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-a> <home>
inoremap <C-e> <end>
inoremap <C-d> <delete>
inoremap <C-i> <Esc>o

noremap <leader><backspace> "_dd
noremap <leader>h g^
noremap <leader>l g$
noremap <leader>n :noh<CR>
noremap <leader>m %

nnoremap <leader><down> :m .+1<CR>==
nnoremap <leader><up> :m .-2<CR>==
"inoremap <leader><down> <Esc>:m .+1<CR>==gi
"inoremap <leader><up> <Esc>:m .-2<CR>==gi
vnoremap <leader><down> :m '>+1<CR>gv=gv
vnoremap <leader><up> :m '<-2<CR>gv=gv


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
"map <leader>ba :bufdo bd<cr>
"
"map <leader>] :bnext<cr>
"map <leader>[ :bprevious<cr>
"
"" Useful mappings for managing tabs
"map <leader>tn :tabnew<cr>
"map <leader>to :tabonly<cr>
"map <leader>tc :tabclose<cr>
"map <leader>tm :tabmove 
"map <leader>t<leader> :tabnext

" NERDTree git
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "M",
    \ "Staged"    : "+",
    \ "Untracked" : "?",
    \ "Renamed"   : "R",
    \ "Unmerged"  : "C",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }