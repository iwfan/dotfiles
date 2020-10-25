" themes
Plug 'glepnir/oceanic-material'
" icon
Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify'

" status line and tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'

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
endfunction

let g:buffet_left_trunc_icon = "\uf0a8"
let g:buffet_right_trunc_icon = "\uf0a9"

let g:rainbow_active = 1
