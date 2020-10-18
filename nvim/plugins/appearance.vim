" themes
Plug 'theniceboy/vim-deus'
Plug 'glepnir/oceanic-material'
" icon
Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify'

" status line and tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'josa42/vim-lightline-coc'

function! appearance#theme()

  let g:oceanic_material_background             = 'ocean'
  let g:oceanic_material_transparent_background = 0
  let g:oceanic_material_allow_bold             = 1
  let g:oceanic_material_allow_italic           = 1
  let g:oceanic_material_allow_underline        = 1
  let g:oceanic_material_allow_undercurl        = 1
  let g:oceanic_material_allow_reverse          = 1

  colorscheme oceanic_material
  hi Visual cterm=reverse ctermfg=111 ctermbg=235 gui=reverse guifg=#a7c777 guibg=#282C34
endfunction

