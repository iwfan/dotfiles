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

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-entire'
Plug 'sgur/vim-textobj-parameter'

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
Plug 'mengelbrecht/lightline-bufferline'
Plug 'mg979/vim-xtabline'

Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'

Plug 'pechorin/any-jump.vim'
" show registers
Plug 'junegunn/vim-peekaboo'

" Tag Management
"Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'

Plug 'voldikss/vim-floaterm'
" }}}

" Enhance {{{
" ------
" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/vim-lightline-coc'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" Git
Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-obsession'
Plug 'liuchengxu/vim-which-key'
" }}}

function! appearance#theme()
  let g:oceanic_material_background             = 'ocean'
  let g:oceanic_material_transparent_background = 0
  let g:oceanic_material_allow_bold             = 1
  let g:oceanic_material_allow_italic           = 1

  colorscheme oceanic_material
  hi! link Visual Search
  hi! link Folded Normal

  hi! link  TabLine Normal
  hi! link  TabLineSel Search
endfunction

