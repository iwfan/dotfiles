" Looks Good {{{
" ------
" theme
Plug 'glepnir/oceanic-material'
" icon
Plug 'ryanoasis/vim-devicons'

Plug 'Yggdroot/indentLine'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
" norcalli/nvim-colorizer.lua
Plug 'RRethy/vim-illuminate'

" }}}

" Behavior{{{
" ------
" text operation
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-obsession'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-lastpat'
Plug 'glts/vim-textobj-comment'
Plug 'somini/vim-textobj-fold'
Plug 'mattn/vim-textobj-url'
Plug 'sgur/vim-textobj-parameter'
Plug 'chaoren/vim-wordmotion'

Plug 'machakann/vim-swap'
Plug 'machakann/vim-textobj-delimited'
Plug 'junegunn/vim-after-object'
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-expand-region'
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

" Git
Plug 'tpope/vim-fugitive'

Plug 'editorconfig/editorconfig-vim'

Plug 'liuchengxu/vim-which-key'
" }}}

function! appearance#theme()
  let g:oceanic_material_background             = 'ocean'
  let g:oceanic_material_transparent_background = 0
  let g:oceanic_material_allow_bold             = 1
  let g:oceanic_material_allow_italic           = 1
  let g:oceanic_material_allow_underline        = 1
  let g:oceanic_material_allow_undercurl        = 1
  let g:oceanic_material_allow_reverse          = 1

  colorscheme oceanic_material
  hi! link Visual Search
  hi! link Folded CursorLine

  hi PmenuSel  cterm=bold ctermfg=239 ctermbg=109 gui=bold guifg=#242a32 guibg=#83a598
  hi clear TabLine
  hi TabLine   ctermfg=243 ctermbg=235 guifg=#7c6f64 guibg=bg
  hi TabLineSel   cterm=bold ctermfg=235 ctermbg=243 gui=bold guifg=bg guibg=#7c6f64
endfunction

let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 1
let g:xtabline_settings.tabline_modes = [ 'buffers', 'tabs' ]
let g:xtabline_settings.mode_labels='none'
let g:xtabline_settings.buffers_paths = 0
let g:xtabline_settings.current_tab_paths = 0
let g:xtabline_settings.other_tabs_paths = 0
let g:xtabline_settings.recent_buffers = 10
let g:xtabline_settings.enable_persistance = 1
