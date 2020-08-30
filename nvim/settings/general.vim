" ====================
" === Editor Setup ===
" ====================

filetype on                             " filetype detection on
filetype plugin on                      " load plugins
syntax on                               " use syntax highlighting
syntax enable

set nocompatible
set mouse=a                             " Enable your mouse
set clipboard=unnamedplus               " Copy paste between vim and everything else
set autochdir
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file

set autoread                            " auto reload files changed outside of vim
set autowriteall
set ttyfast                             " should make scrolling faster
set lazyredraw                          " same as above
set updatetime=300                      " Faster completion
set timeoutlen=300                      " By default timeoutlen is 1000 ms

set noswapfile
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
if has("persistent_undo")
  set undofile
  set undodir=~/.config/nvim/tmp/undo,.
endif
set noerrorbells                        " disable bells
set novisualbell                        " disable bells
set noerrorbells                        " disable bells
set vb t_vb=

let &t_ut=''
set t_Co=256                            " this fixes colors on OS X terminal
let &t_SI="\<Esc>]50;CursorShape=1\x7"  " chang cursor style in difference mode
let &t_SR="\<Esc>]50;CursorShape=2\x7"  " chang cursor style in difference mode
let &t_EI="\<Esc>]50;CursorShape=0\x7"  " chang cursor style in difference mode

set number
set relativenumber
set cursorline
set noshowmode
set showcmd
set cmdheight=1                         " More space for displaying messages
set laststatus=2                        " Always display the status line
set ruler                               " Show the cursor position all the time
set wildmenu
set wildignore+=*.swp,*.bak,log/**,node_modules/**,*.rbc
set wildignorecase

set showtabline=2                       " Always show tabs
set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=2
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set copyindent                          " copy indent from the previous line

set hlsearch                            " 高亮搜索
set incsearch                           " 自动定位到输入中的字符串，不需要回车搜索
set ignorecase                          " 搜索时智能匹配大小写
set smartcase
set matchpairs+=<:>,「:」               " %默认匹配()、[]、{}，增加匹配<>
set showmatch                           " Show matching brackets when text indicator is over them

set wrap                                " Break line at predefined characters
set linebreak                           " Character to show before the lines that have been soft-wrapped
set showbreak=↪
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set hidden                              " Required to keep multiple buffers open multiple buffers
set iskeyword+=-                        " treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

set list
set listchars=tab:\↹\ ,trail:␣
set scrolloff=4
set viewoptions=cursor,folds,slash,unix

set indentexpr=
set foldmethod=indent
set foldlevel=99
set foldenable
set formatoptions-=tc

set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set colorcolumn=100
set virtualedit=block

set splitright
set splitbelow
