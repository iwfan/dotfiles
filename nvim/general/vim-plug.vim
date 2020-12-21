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
Plug 'Shougo/context_filetype.vim'
Plug 'tyru/caw.vim'

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

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

Plug 'junegunn/vim-peekaboo'
Plug 'voldikss/vim-floaterm'

Plug 'editorconfig/editorconfig-vim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
