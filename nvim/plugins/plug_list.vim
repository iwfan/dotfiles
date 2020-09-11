""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Plugins                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
 silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')


" Plugin Recommandtion: https://zhuanlan.zhihu.com/p/58816186

" theme plugins
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'theniceboy/vim-deus'
" icon
Plug 'ryanoasis/vim-devicons'

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'luochen1990/rainbow'
Plug 'liuchengxu/vim-which-key'
Plug 'godlygeek/tabular'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" status line and tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'josa42/vim-lightline-coc'

Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'

" editor enhancement
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'
" Tag Management
"Plug 'ludovicchabant/vim-gutentags'
"Plug 'liuchengxu/vista.vim'

" Git
Plug 'tpope/vim-fugitive'

Plug 'scrooloose/nerdcommenter'
Plug 'voldikss/vim-floaterm'

" markdown support
Plug 'plasticboy/vim-markdown'
Plug 'sheerun/vim-polyglot',{'for':['py', 'go', 'java', 'vim', 'json', 'html5', 'javascript', 'typescript', 'sh']}

"Plug 'junegunn/vim-easy-align', {'on':'<Plug>(EasyAlign)'}
"Plug 'voldikss/vim-translator', { 'on':'<Plug>Translate' }

"Plug 'junegunn/fzf', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks'] }
"Plug 'junegunn/fzf.vim', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks']}


Plug 'mattn/emmet-vim'

" Print function signatures in echo area
"Plug 'Shougo/echodoc.vim'

" === Javascript Plugins === "
" Typescript syntax highlighting
"Plug 'HerringtonDarkholme/yats.vim'
" Improved syntax highlighting and indentation
"Plug 'othree/yajs.vim'

" ReactJS JSX syntax highlighting
"Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
"Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for javascript libraries
"Plug 'othree/javascript-libraries-syntax.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

let g:undotree_WindowLayout                    = 3

let g:rainbow_active                           = 1

let g:user_emmet_install_global                = 0
autocmd FileType html,css,jsx,tsx EmmetInstall
let g:user_emmet_mode                          = 'in'
let g:user_emmet_leader_key                    = '<Tab>'

let g:floaterm_width                           = 0.8
let g:floaterm_height                          = 0.8

