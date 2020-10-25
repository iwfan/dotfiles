" themes
Plug 'glepnir/oceanic-material'
" icon
Plug 'ryanoasis/vim-devicons'

Plug 'liuchengxu/vim-which-key'

" startify
Plug 'mhinz/vim-startify'

" status line and tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

Plug 'mg979/vim-xtabline'




Plug 'luochen1990/rainbow'

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
endfunction

let g:rainbow_active = 1

let g:xtabline_settings = {}
let g:xtabline_settings.enable_mappings = 1
let g:xtabline_settings.tabline_modes = [ 'buffers', 'tabs' ]
let g:xtabline_settings.mode_labels='none'
let g:xtabline_settings.buffers_paths = 0
let g:xtabline_settings.current_tab_paths = 0
let g:xtabline_settings.other_tabs_paths = 0
let g:xtabline_settings.recent_buffers = 5
let g:xtabline_settings.enable_persistance = 1
let g:xtabline_settings.last_open_first = 1
au BufReadPost * exec "XTabTheme tomorrow"
