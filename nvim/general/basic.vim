""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
syntax enable                           " use syntax highlighting
filetype plugin on
filetype indent on

set timeout ttimeout
set timeoutlen=500                      " Time out on mappings
set ttimeoutlen=10                      " Time out on key codes
set updatetime=100                      " Idle time to write swap and trigger CursorHold
set redrawtime=1500                     " Time in milliseconds for stopping display redraw
set ttyfast                             " should make scrolling faster
set lazyredraw                          " same as above

set binary
set autoread                            " auto reload files changed outside of vim
set autowrite
set autowriteall

set encoding=utf-8                      " configure the encoding
set fileencoding=utf-8
set termencoding=utf-8                  " it will choose the first right configure to use
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set fileformats=unix,dos,mac

set noswapfile
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set undofile                            " enable undo after close the file
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set tags=$HOME/.vim/tags
set dictionary+=/usr/share/dict/words   " autocompletion with dictionary help
set dictionary+=$HOME/.vim/dict/

set pastetoggle=<F3>
set clipboard=unnamed,unnamedplus

if has("gui_running")
  set mouse=a                             " Enable your mouse
  set gfn=Source\ Code\ Pro\ Regular\ 12
  set guioptions-=m
  set guioptions-=T
  set guioptions-=r
  set guioptions-=L
endif

set termguicolors                       " Support True Color in terminal
set number
set relativenumber
set cursorline
set noshowmode
set nomodeline                          " disable mode lines (security measure)
set showcmd
set cmdheight=1                         " More space for displaying messages
set laststatus=2                        " Always display the status line
set showtabline=2                       " Always show tabs
set nostartofline                       " Cursor in same column for few commands
set ruler                               " Show the cursor position all the time
set magic
set list
set listchars=tab:\↹\ ,nbsp:␣,trail:·,extends:→,precedes:←
set fillchars=eob:\                     " do not show ~ before empty lines at the end of a buffer
set scrolloff=5
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set splitright
set splitbelow
set display+=lastline
set noerrorbells novisualbell t_vb=     " cancel the annoying bell
set belloff=all
set nospell                             " close spell examine
set confirm                             " Confirm before vim exit
set statusline+=%*
set statusline+=%#warningmsg#
set shortmess+=filmnrxoOtT              " Abbrev. of messages (avoids 'hit enter')
let &t_ut=''
set t_Co=256                            " this fixes colors on OS X terminal

set hidden                              " Required to keep multiple buffers open multiple buffers
set switchbuf=useopen,vsplit            " quickfix window instead of opening new buffers
" set iskeyword+=-                        " treat dash separated words as a word text object
set backspace=indent,eol,start          " Intuitive backspacing in insert mode
set completeopt=longest,noinsert,menuone,noselect,preview,menu
" Selected characters/lines in visual mode
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore                         " used with caution of breaking plugins

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175

set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=-1                      " Automatically keeps in sync with shiftwidth
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
" set copyindent                          " copy indent from the previous line
set shiftround                          " Round indent to multiple of 'shiftwidth'

set ignorecase                          " Search ignoring case
set smartcase                           " Keep case when searching with *
set infercase                           " Adjust case in insert completion mode
set incsearch                           " Incremental search
set wrapscan                            " Searches wrap around the end of the file
set hlsearch                            " Highlight search results
set showmatch                           " Show matching brackets when text indicator is over them
set matchpairs+=<:>,「:」               " %默认匹配()、[]、{}，增加匹配<>

set wrap                                " Break line at predefined characters
set whichwrap+=<,>,h,l,[,]
set showbreak=↪
"set colorcolumn=100

set wildmenu
if has('nvim')                          " Use floating windows to complete the commond, only neovim support
  set wildoptions=pum
  set pumblend=30                       " Let floatingwindow to be transparable
else
  set wildmode=list:longest,full        " Set list to show completeopt, however it will lead to disfunc for floating windows
endif
set wildignorecase
set history=1000                                                        " save 1000 cmd
set wildignore+=*.o,*~,*.pyc,*.swp,*.bak,*.class,*.DS_Store,node_modules/**              " vim will ignore them
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set wildignore+=.git\*,.hg\*,.svn\*

set foldenable
set foldmethod=syntax
set foldlevel=99
set foldlevelstart=99
