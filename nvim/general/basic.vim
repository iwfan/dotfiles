""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Sensible {{{
" ------
if &compatible
  set nocompatible
endif

if has('autocmd')
  filetype plugin indent on
endif

if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" }}}


" Appearance {{{
" ------
set termguicolors                       " Support True Color in terminal
set number
set relativenumber
set cursorline
set noshowmode
set nomodeline                          " disable mode lines (security measure)
set showcmd
set cmdheight=2                         " More space for displaying messages
set laststatus=2                        " Always display the status line
set showtabline=2                       " Always show tabs
set ruler                               " Show the cursor position all the time
set display+=lastline

set list
set listchars=tab:\↹\ ,nbsp:␣,trail:·,extends:→,precedes:←
set fillchars=eob:\                     " do not show ~ before empty lines at the end of a buffer
set scrolloff=5
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
" }}}


" Behavior{{{
" ------

set encoding=utf-8                      " configure the encoding
set fileencoding=utf-8

set ttimeout
set ttimeoutlen=100                     " Time out on key codes

set autowrite
set autowriteall

set noswapfile
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set undofile                            " enable undo after close the file

set pastetoggle=<leader>"
set clipboard=unnamed,unnamedplus
set mouse=a                             " Enable your mouse
set splitright
set splitbelow

set statusline+=%*
set statusline+=%#warningmsg#

set history=1000                        " save 1000 cmd
set tabpagemax=50

set sessionoptions-=options
set viewoptions-=options

set noerrorbells novisualbell t_vb=     " cancel the annoying bell
set confirm                             " Confirm before vim exit

" }}}

" Misc {{{
" ------

" }}}


" let &t_ut=''
" set t_Co=256                            " this fixes colors on OS X terminal

set hidden                              " Required to keep multiple buffers open multiple buffers
set switchbuf=useopen,vsplit            " quickfix window instead of opening new buffers
" set iskeyword+=-                        " treat dash separated words as a word text object
set backspace=indent,eol,start          " Intuitive backspacing in insert mode
set completeopt=longest,noinsert,menuone,noselect,preview,menu
" Selected characters/lines in visual mode
set virtualedit=onemore                         " used with caution of breaking plugins



" Tabs and Indents and Wrap {{{
" ----------------
set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=-1                      " Automatically keeps in sync with shiftwidth
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
" set copyindent                          " copy indent from the previous line
set shiftround                          " Round indent to multiple of 'shiftwidth'

set wrap                                " Break line at predefined characters
set whichwrap+=<,>,h,l,[,]
set showbreak=↪
set colorcolumn=120
set textwidth=120
" set linebreak                           " Break long lines at 'breakat'
" set breakat+=\ \	                      " Long lines break chars

if exists('&breakindent')
  set breakindentopt=shift:2,min:20
endif

" }}}


" Search {{{
" ----------------
set ignorecase                          " Search ignoring case
set smartcase                           " Keep case when searching with *
set infercase                           " Adjust case in insert completion mode
set incsearch                           " Incremental search
set wrapscan                            " Searches wrap around the end of the file
set hlsearch                            " Highlight search results
set showmatch                           " Show matching brackets when text indicator is over them
set matchpairs+=<:>,「:」               " %默认匹配()、[]、{}，增加匹配<>

" }}}

set formatoptions+=1                      " Don't break lines after a one-letter word
set formatoptions-=t                      " Don't auto-wrap text
set formatoptions-=o                      " Disable comment-continuation (normal 'o'/'O')
set formatoptions+=j                      " Remove comment leader when joining lines


set wildmenu
if has('nvim')                          " Use floating windows to complete the commond, only neovim support
  set wildoptions=pum
  set pumblend=30                       " Let floatingwindow to be transparable
else
  set wildmode=list:longest,full        " Set list to show completeopt, however it will lead to disfunc for floating windows
endif
set wildignorecase
set wildignore+=*.o,*~,*.pyc,*.swp,*.bak,*.class              " vim will ignore them
set wildignore+=.git,.hg,.svn,.stversions,*.pyc,*.spl,*.o,*.out,*~,%*
set wildignore+=*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store
set wildignore+=**/node_modules/**,**/bower_modules/**,*/.sass-cache/*
set wildignore+=application/vendor/**,**/vendor/ckeditor/**,media/vendor/**
set wildignore+=__pycache__,*.egg-info,.pytest_cache,.mypy_cache/**

set foldenable
set foldmethod=syntax
set foldlevel=99
set foldlevelstart=99
