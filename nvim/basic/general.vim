""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype on                             " filetype detection on
filetype plugin indent on               " load plugins

if has('syntax')
    syntax enable                       " use syntax highlighting
endif

scriptencoding utf-8
set encoding=utf-8                      " configure the encoding
set termencoding=utf-8                  " it will choose the first right configure to use
set fileencodings=utf-8,gbk,utf-16le,cp1252,iso-8859-15,ucs-bom
set fileformats=unix,dos,mac

set autoread                            " auto reload files changed outside of vim
set autowrite
set autowriteall

set timeout ttimeout
set timeoutlen=500                      " Time out on mappings
set ttimeoutlen=10                      " Time out on key codes
set updatetime=300                      " Idle time to write swap and trigger CursorHold
set redrawtime=1500                     " Time in milliseconds for stopping display redraw
set ttyfast                             " should make scrolling faster
set lazyredraw                          " same as above

set noswapfile
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set undofile                            " enable undo after close the file
set undodir=$HOME/.vim/undo
set undolevels=1000
set undoreload=10000

set tags=./tags;/,$HOME/.vim/tags
set dictionary+=/usr/share/dict/words   " autocompletion with dictionary help
set dictionary+=$HOME/.vim/dict/

set mouse=a                             " Enable your mouse
if has('clipboard')
    if has('unnamedplus')               " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else                                " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

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
set list
set listchars=tab:»·,nbsp:␣,trail:·,extends:→,precedes:←
set fillchars=eob:\ 
set scrolloff=5
set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
set splitright
set splitbelow
set display+=lastline
set noerrorbells novisualbell t_vb=     " cancel the annoying bell
set belloff=all
set nospell                             " close spell examine
set confirm                             " Confirm before vim exit
set termguicolors                       " Support True Color in terminal
set statusline+=%*
set statusline+=%#warningmsg#
set shortmess+=filmnrxoOtT              " Abbrev. of messages (avoids 'hit enter')
let &t_ut=''
set t_Co=256                            " this fixes colors on OS X terminal

set hidden                              " Required to keep multiple buffers open multiple buffers
set switchbuf=useopen,vsplit            " quickfix window instead of opening new buffersset iskeyword+=-                        " treat dash separated words as a word text object
set backspace=indent,eol,start          " Intuitive backspacing in insert mode
set completeopt=longest,noinsert,menuone,noselect,preview,menu
" Selected characters/lines in visual mode
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore                         " used with caution of breaking plugins

let &t_SI="\<Esc>]50;CursorShape=1\x7"  " chang cursor style in difference mode
let &t_SR="\<Esc>]50;CursorShape=2\x7"  " chang cursor style in difference mode
let &t_EI="\<Esc>]50;CursorShape=0\x7"  " chang cursor style in difference mode

" wrap config (not recommend
" formation options
" default is tcq 
" t: 根据 textwidth 自动折行
" c: 在（程序源代码中的）注释中自动折行，插入合适的注释起始字符
" r: 插入模式下在注释中键入回车时，插入合适的注释起始字符
" q: 允许使用"gq"命令对注释进行格式化；
" n: 识别编号列表，编号行的下一行的缩进由数字后的空白决定（与“2”冲突，需要“autoindent”）；
" 2: 使用一段的第二行的缩进来格式化文本；
" l: 在当前行长度超过 textwidth 时，不自动重新格式化；
" m: 在多字节字符处可以折行，对中文特别有效（否则只在空白字符处折行）；
" M: 在拼接两行时（重新格式化，或者是手工使用“J”命令），如果前一行的结尾或后一行的开头是多字节字符，则不插入空格，非常适合中文
" 
" set textwidth=80 "最大字符长度
set formatoptions-=t                    " disable wrap

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
set showmatch                           " Show matching brackets when text indicator is over them
set matchpairs+=<:>,「:」               " %默认匹配()、[]、{}，增加匹配<>

"set wrap                                " Break line at predefined characters
"set colorcolumn=100
set nowrap                              " No wrap by default
set linebreak                           " Break long lines at 'breakat'
set breakat=\ \	;:,!?                   " Long lines break chars
set showbreak=↪
set whichwrap=b,s,h,l,<,>,>h,[,]        " Backspace and cursor keys wrap too

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
if has('win16') || has('win32')
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

" fold config
" foldmethod [diff, expr, indent, manual, marker, syntax]
" diff show the diff between unfold and fold
" expr use `foldexpr` to config fold logic
" indent fold base on indent
" manual use zf zF or :Fold to fold, zfa(,
"                     :mkview to save 
"                     :loadview to reload
" mark ....
" syntax
set foldenable
set foldmethod=manual
set foldlevel=99
set foldlevelstart=99

set title
set titlelen=95
let &g:titlestring="
			\ %{expand('%:p:~:.')}%(%m%r%w%)
			\ %<\[%{fnamemodify(getcwd(), ':~')}\] - Neovim"

let gitroot = substitute(system('git rev-parse --show-toplevel'),'[\n\r]', '', 'g')                          " Make tags placed in .git/tags file available in all levels of a repository
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif
