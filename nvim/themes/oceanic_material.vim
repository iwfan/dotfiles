augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END

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
