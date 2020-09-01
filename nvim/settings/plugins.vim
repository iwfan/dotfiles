" ====================
" === Plugin Setup ===
" ====================

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
 silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" theme plugins
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'theniceboy/vim-deus'

" status line and tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

" icon
Plug 'ryanoasis/vim-devicons'

" editor enhancement
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'luochen1990/rainbow'



" Git
Plug 'tpope/vim-fugitive'



"Plug 'metalelf0/supertab'
"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'junegunn/vim-easy-align', {'on':'<Plug>(EasyAlign)'}
"Plug 'voldikss/vim-translator', { 'on':'<Plug>Translate' }
"Plug 'kristijanhusak/defx-git', {'on':'Defx'}
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'}
"Plug 'kristijanhusak/defx-icons'
"Plug 'junegunn/fzf', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks'] }
"Plug 'junegunn/fzf.vim', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks']}

Plug 'scrooloose/nerdcommenter'

Plug 'mattn/emmet-vim'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Denite - Fuzzy finding, buffer management
"Plug 'Shougo/denite.nvim'

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

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


"colorscheme gruvbox
"colorscheme onedark
colorscheme deus

source $HOME/dotfiles/nvim/settings/plug-settings/lightline.vim

let g:EasyMotion_smartcase = 1

let g:undotree_WindowLayout = 3

let g:rainbow_active = 1

let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,tsx EmmetInstall
let g:user_emmet_mode='in'
let g:user_emmet_leader_key='<Tab>'


