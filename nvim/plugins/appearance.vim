" Looks Good {{{
" ------
" theme
Plug 'glepnir/oceanic-material'
" icon
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
" Plug 'kana/vim-textobj-line'             " al il
Plug 'kana/vim-textobj-entire'           " ae ie
" Plug 'coderifous/textobj-word-column.vim' " adds ic, ac, iC, and aC as text-objects.
" Plug 'michaeljsmith/vim-indent-object'    " ii/ai iI/aI
" Plug 'jeetsukumaran/vim-indentwise'       " move by indent [-  ]-   [+ ]+

Plug 'machakann/vim-swap'
Plug 'machakann/vim-textobj-delimited'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'

Plug 'godlygeek/tabular'
Plug 'AndrewRadev/splitjoin.vim'

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
" Plug 'mengelbrecht/lightline-bufferline'
Plug 'mg979/vim-xtabline'

Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'

Plug 'pechorin/any-jump.vim'
" show registers
Plug 'junegunn/vim-peekaboo'

" Find & Replace
Plug 'brooth/far.vim', { 'on': ['F', 'Far', 'Fardo'] }

" Tag Management
"Plug 'ludovicchabant/vim-gutentags'
" Plug 'liuchengxu/vista.vim'

Plug 'voldikss/vim-floaterm'
" }}}

" Enhance {{{
" ------
Plug 'tpope/vim-repeat'          " makes some plugins repeatable
Plug 'tpope/vim-abolish'         " I mostly use :S for smart replace
Plug 'tpope/vim-obsession'
" Git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'
Plug 'rhysd/git-messenger.vim'

" Plug 'wellle/context.vim'
" Plug 'wellle/visual-split.vim'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/vim-lightline-coc'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vim-which-key'
" }}}

function! appearance#theme()
  let g:oceanic_material_background             = 'ocean'
  let g:oceanic_material_transparent_background = 0
  let g:oceanic_material_allow_bold             = 1
  let g:oceanic_material_allow_italic           = 1

  colorscheme oceanic_material
  hi! link Visual Search
  hi! link MatchParen PmenuSel
  hi! link Folded Normal

  hi! link  TabLine Normal
  hi! link  TabLineSel Search
endfunction
