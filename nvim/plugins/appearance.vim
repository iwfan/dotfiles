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

let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['buffers', 'tabs']
let g:xtabline_settings.enable_persistance = 1
let g:xtabline_settings.last_open_first = 0

let g:matchup_matchparen_offscreen  = {}

let g:tcomment_maps = 1
let g:tcomment_mapleader1 = ''
let g:tcomment_mapleader2 = ''
let g:tcomment_mapleader_uncomment_anyway = ''
let g:tcomment_mapleader_comment_anyway = ''
map <silent> <C-_> :TComment<cr>
imap <silent> <C-_> <esc>:TComment<cr>a

exec 'source ' . stdpath('data') . '/plugged/vim-sandwich/macros/sandwich/keymap/surround.vim'
let g:sandwich#recipes += [
\   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
\
\   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
\
\   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
\
\   {'buns': ['{\s*', '\s*}'],   'nesting': 1, 'regex': 1,
\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
\    'action': ['delete'], 'input': ['{']},
\
\   {'buns': ['\[\s*', '\s*\]'], 'nesting': 1, 'regex': 1,
\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
\    'action': ['delete'], 'input': ['[']},
\
\   {'buns': ['(\s*', '\s*)'],   'nesting': 1, 'regex': 1,
\    'match_syntax': 1, 'kind': ['delete', 'replace', 'textobj'],
\    'action': ['delete'], 'input': ['(']},
\ ]



