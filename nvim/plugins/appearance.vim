" themes
Plug 'theniceboy/vim-deus'
Plug 'glepnir/oceanic-material'
Plug 'arcticicestudio/nord-vim'
" icon
Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify'

" status line and tabline
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'josa42/vim-lightline-coc'



function! appearance#oceanic_material_theme()
  let g:oceanic_material_allow_bold      = 1
  let g:oceanic_material_allow_italic    = 1
  let g:oceanic_material_allow_underline = 1
  let g:oceanic_material_allow_undercurl = 1
  let g:oceanic_material_allow_reverse   = 1

  colorscheme oceanic_material
  hi VertSplit cterm=reverse ctermfg=235 ctermbg=239 gui=reverse guifg=#282C34 guibg=#504945
  hi Visual cterm=reverse ctermfg=111 ctermbg=235 gui=reverse guifg=#a7c777 guibg=#282C34
  highlight Sneak ctermfg=235 ctermbg=111 guifg=#282C34 guibg=#a7c777
endfunction


function! appearance#theme()
  " colorscheme deus
  " highlight clear SignColumn              " gutter is the same color as where your line numbers show up

  let g:nord_uniform_status_lines = 1
  let g:nord_bold = 1
  let g:nord_italic = 1
  let g:nord_underline = 1
  let g:nord_italic_comments = 0

  colorscheme nord

endfunction


