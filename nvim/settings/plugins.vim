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
Plug 'liuchengxu/vim-which-key'
"Plug 'ervandew/supertab'

if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/denite.nvim'
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

Plug 'kristijanhusak/defx-git', {'on':'Defx'}
Plug 'kristijanhusak/defx-icons'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}


" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

Plug 'scrooloose/nerdcommenter'


"Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'junegunn/vim-easy-align', {'on':'<Plug>(EasyAlign)'}
"Plug 'voldikss/vim-translator', { 'on':'<Plug>Translate' }
"
"
"Plug 'junegunn/fzf', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks'] }
"Plug 'junegunn/fzf.vim', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks']}


Plug 'mattn/emmet-vim'

" Denite - Fuzzy finding, buffer management
"Plug 'Shougo/denite.nvim'

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




let g:EasyMotion_smartcase = 1

let g:undotree_WindowLayout = 3

let g:rainbow_active = 1

let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,tsx EmmetInstall
let g:user_emmet_mode='in'
let g:user_emmet_leader_key='<Tab>'

nmap ]c <Plug>(GitGutterNextHunk)
nmap [c <Plug>(GitGutterPrevHunk)
nmap gcp <Plug>(GitGutterPreviewHunk)
