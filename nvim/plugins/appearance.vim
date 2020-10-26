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
let g:xtabline_settings.recent_buffers = 5
let g:xtabline_settings.enable_persistance = 1
