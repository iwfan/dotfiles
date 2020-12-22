if has('macunix') || has("unix")
  let PLATFORM = 'unix'
else
  let PLATFORM = 'win'
endif

" auto-install vim-plug
if (PLATFORM == 'unix') && empty(glob(VIM_SCRIPT_PATH . '/autoload/plug.vim'))
 silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-repeat'          " makes some plugins repeatable
Plug 'tpope/vim-abolish'         " I mostly use :S for smart replace
Plug 'tpope/vim-obsession'

Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'nvim-treesitter/playground'
Plug 'glepnir/zephyr-nvim'

Plug 'mhinz/vim-startify'

Plug 'kyazdani42/nvim-tree.lua'
Plug 'Akin909/nvim-bufferline.lua'
Plug 'moll/vim-bbye'
Plug 'glepnir/galaxyline.nvim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'glepnir/indent-guides.nvim'

Plug 'machakann/vim-sandwich'
Plug 'wellle/targets.vim'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'junegunn/vim-easy-align'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'andymass/vim-matchup'

Plug 'Raimondi/delimitMate'

" Comment
Plug 'tomtom/tcomment_vim'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'], 'do': ':UpdateRemotePlugins' }

" Speed j/k when press
Plug 'rhysd/accelerated-jk'

" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'
Plug 'mhinz/vim-signify'

Plug 'junegunn/vim-peekaboo'
Plug 'voldikss/vim-floaterm'

Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vim-which-key'
Plug 'mbbill/undotree'

" Plug 'neovim/nvim-lspconfig'
" Plug 'nvim-lua/completion-nvim'
" Plug 'nvim-lua/diagnostic-nvim'
" Plug 'nvim-lua/lsp-status.nvim'

" Plug 'AndrewRadev/splitjoin.vim'
" Plug 'machakann/vim-swap'
" Plug 'machakann/vim-textobj-delimited'
" 
" " searching
" Plug 'justinmk/vim-sneak'
" Plug 'haya14busa/incsearch.vim'
" Plug 'easymotion/vim-easymotion'
" Plug 'haya14busa/incsearch-easymotion.vim'
" 
" Plug 'pechorin/any-jump.vim'
" 
" Plug 'liuchengxu/vista.vim'
" 
" " === html Plugins === "
" Plug 'alvan/vim-closetag'
" Plug 'AndrewRadev/tagalong.vim'
" 
" " === css Plugins === "
" Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'javascript','javascriptreact' ] }
" 
" " === Javascript Plugins === "
" Plug 'moll/vim-node'
" Plug 'leafgarland/typescript-vim'
" Plug 'peitalin/vim-jsx-typescript'
" 
" Plug 'prettier/vim-prettier', {
"  \ 'do': 'yarn install',
"  \ 'for': ['javascript', 'typescript', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
