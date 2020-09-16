""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 PLUGINS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
 silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')


" Plugin Recommandtion: https://zhuanlan.zhihu.com/p/58816186
"
"https://github.com/kana/vim-textobj-user
"https://github.com/machakann/vim-swap
"https://github.com/AndrewRadev/splitjoin.vim
"https://github.com/tpope/vim-unimpaired
"https://github.com/ntpeters/vim-better-whitespace
"https://github.com/terryma/vim-expand-region
"https://github.com/svermeulen/vim-easyclip
"https://github.com/junegunn/vim-easy-align
"https://github.com/liuchengxu/vim-clap
"thaerkh/vim-workspace
"dyng/ctrlsf.vim
"bagrat/vim-buffet
" https://github.com/konfekt/fastfold
" https://github.com/pseewald/vim-anyfold

"""""""""""""""""""""""""""""""""""""""
"            Appearance               "
"""""""""""""""""""""""""""""""""""""""
Plug 'theniceboy/vim-deus'
Plug 'glepnir/oceanic-material'

" icon
Plug 'ryanoasis/vim-devicons'


"""""""""""""""""""""""""""""""""""""""
"            Behavior                 "
"""""""""""""""""""""""""""""""""""""""
Plug 'liuchengxu/vim-which-key'

Plug 'editorconfig/editorconfig-vim'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" status line and tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'josa42/vim-lightline-coc'

" text operation
" Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'machakann/vim-swap'
Plug 'junegunn/vim-after-object'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'junegunn/vim-easy-align'
Plug 'godlygeek/tabular'

Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'

Plug 'andymass/vim-matchup'

" editor enhancement
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'
Plug 'qpkorr/vim-bufkill'

Plug 'pechorin/any-jump.vim'
Plug '907th/vim-auto-save'

" Tag Management
"Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'

" Git
Plug 'tpope/vim-fugitive'

"Comment
Plug 'tpope/vim-commentary'

Plug 'voldikss/vim-floaterm'

" markdown support
Plug 'plasticboy/vim-markdown'
"Plug 'dkarter/bullets.vim'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

"Plug 'junegunn/fzf', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks'] }
"Plug 'junegunn/fzf.vim', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks']}

Plug 'mattn/emmet-vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'sheerun/vim-polyglot'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'
" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

let g:undotree_WindowLayout                    = 4

let g:user_emmet_install_global                = 0
autocmd FileType html,css,jsx,tsx EmmetInstall
let g:user_emmet_mode                          = 'in'
let g:user_emmet_leader_key                    = '<Tab>'

let g:tagalong_verbose = 1

let g:floaterm_width                           = 0.8
let g:floaterm_height                          = 0.8

