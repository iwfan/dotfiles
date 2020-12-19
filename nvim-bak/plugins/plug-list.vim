""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 PLUGINS                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" auto-install vim-plug
if (PLATFORM == 'unix') && empty(glob(VIM_SCRIPT_PATH . '/autoload/plug.vim'))
 silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

" Looks Good {{{
" ------
" theme
Plug 'glepnir/oceanic-material'
" icon
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
" }}}

" Behavior{{{
" ------
" text operation
Plug 'machakann/vim-sandwich'
Plug 'terryma/vim-expand-region'
Plug 'chaoren/vim-wordmotion'
Plug 'wellle/targets.vim'     " it's awesome!!!

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'           " ae ie
" Plug 'coderifous/textobj-word-column.vim' " adds ic, ac, iC, and aC as text-objects.
" Plug 'michaeljsmith/vim-indent-object'    " ii/ai iI/aI
" Plug 'jeetsukumaran/vim-indentwise'       " move by indent [-  ]-   [+ ]+

Plug 'AndrewRadev/splitjoin.vim'
Plug 'machakann/vim-swap'
Plug 'machakann/vim-textobj-delimited'
Plug 'junegunn/vim-easy-align'

" searching
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'justinmk/vim-sneak'
Plug 'haya14busa/incsearch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'andymass/vim-matchup'
Plug 'markonm/traces.vim'

"Comment
Plug 'tomtom/tcomment_vim'
" }}}

" Like IDE {{{
" ------
" startify
Plug 'mhinz/vim-startify'
" status line and tabline
Plug 'itchyny/lightline.vim'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'akinsho/nvim-bufferline.lua'

" Plug 'romgrk/barbar.nvim'
Plug 'moll/vim-bbye'

Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'

Plug 'pechorin/any-jump.vim'
" show registers
Plug 'junegunn/vim-peekaboo'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'], 'do': ':UpdateRemotePlugins' }

" Tag Management
Plug 'liuchengxu/vista.vim'

Plug 'voldikss/vim-floaterm'
" }}}

" Enhance {{{
" ------
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'          " makes some plugins repeatable
Plug 'tpope/vim-abolish'         " I mostly use :S for smart replace
Plug 'tpope/vim-obsession'
" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/vim-lightline-coc'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vim-which-key'
" }}}

" Language {{{
" ------

Plug 'sheerun/vim-polyglot'

" === html Plugins === "
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

" === css Plugins === "
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'javascript','javascriptreact' ] }

" === Javascript Plugins === "
Plug 'moll/vim-node'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === markdown Plugins === "
Plug 'godlygeek/tabular'

" === code format === ""
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
" }}}

call plug#end()

" Automatically install missing plugins on startup
if (PLATFORM == 'unix')
  autocmd VimEnter *
    \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
    \|   PlugInstall --sync | q
    \| endif
endif

call helpers#source_dir(VIM_SCRIPT_PATH . '/plugins/config')
