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
scriptencoding utf-8
"set autochdir
set encoding=utf-8                      " The encoding displayed
set fileencoding=utf-8                  " The encoding written to file

set autoread                            " auto reload files changed outside of vim
set autowriteall
set ttyfast                             " should make scrolling faster
set lazyredraw                          " same as above

set termguicolors                       " Support True Color in terminal
set background=dark
let g:enable_bold_font=1
let g:enable_italic_font=1

highlight clear SignColumn              " gutter is the same color as where your line numbers show up

let &t_ut=''
set t_Co=256                            " this fixes colors on OS X terminal
let &t_SI="\<Esc>]50;CursorShape=1\x7"  " chang cursor style in difference mode
let &t_SR="\<Esc>]50;CursorShape=2\x7"  " chang cursor style in difference mode
let &t_EI="\<Esc>]50;CursorShape=0\x7"  " chang cursor style in difference mode

set timeout ttimeout
set timeoutlen=500                      " Time out on mappings
set ttimeoutlen=10                      " Time out on key codes
set updatetime=100                      " Idle time to write swap and trigger CursorHold
set redrawtime=1500                     " Time in milliseconds for stopping display redraw

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

set number
set relativenumber
set cursorline
set noshowmode
set showcmd
set cmdheight=1                         " More space for displaying messages
set laststatus=2                        " Always display the status line
set showtabline=2                       " Always show tabs
set ruler                               " Show the cursor position all the time
set wildmenu
set wildignore+=*.swp,*.bak,log/**,node_modules/**,*.rbc
set wildignore+=*.DS_Store,.git,.svn,*.o,*.out
set wildignorecase
set title
set titlelen=95
let &g:titlestring="
			\ %{expand('%:p:~:.')}%(%m%r%w%)
			\ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"

set colorcolumn=100
set textwidth=100                       " Text width maximum chars before wrapping
set tabstop=2                           " Insert 2 spaces for a tab
set softtabstop=-1                      " Automatically keeps in sync with shiftwidth
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set copyindent                          " copy indent from the previous line
set shiftround                          " Round indent to multiple of 'shiftwidth'

set ignorecase                          " Search ignoring case
set smartcase                           " Keep case when searching with *
set infercase                           " Adjust case in insert completion mode
set incsearch                           " Incremental search
set wrapscan                            " Searches wrap around the end of the file
set hlsearch                            " Highlight search results
set matchpairs+=<:>,「:」               " %默认匹配()、[]、{}，增加匹配<>
set showmatch                           " Show matching brackets when text indicator is over them
set complete=.,w,b,k                    " C-n completion: Scan buffers, windows and dictionary

"set wrap                                " Break line at predefined characters
set nowrap                              " No wrap by default
set linebreak                           " Break long lines at 'breakat'
set breakat=\ \	;:,!?                   " Long lines break chars
set showbreak=↪
set nostartofline                       " Cursor in same column for few commands
set whichwrap+=h,l,<,>,[,],~            " Move to following line on certain keys
set splitbelow splitright               " Splits open bottom right
set switchbuf=useopen,vsplit            " Jump to the first open window
set backspace=indent,eol,start          " Intuitive backspacing in insert mode
set diffopt=filler,iwhite               " Diff mode: show fillers, ignore whitespace
set completeopt=menu,menuone            " Always show menu, even for one item
set completeopt+=noselect,noinsert

set confirm
set hidden                              " Required to keep multiple buffers open multiple buffers
set iskeyword+=-                        " treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

set list
set listchars=tab:»·,nbsp:␣,trail:·,extends:→,precedes:←
set scrolloff=4
set viewoptions=cursor,folds,slash,unix

set foldenable
set foldmethod=indent
set indentexpr=
set foldlevel=99

set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set inccommand=split
set completeopt=longest,noinsert,menuone,noselect,preview
set virtualedit=block

set splitright
set splitbelow
