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


hi! BufferInactive guifg=#888888 guibg=#1b2b34
hi! BufferInactiveIndex guifg=#504945 guibg=#1b2b34
hi! BufferInactiveMod guifg=#d8a657 guibg=#1b2b34
hi! BufferInactiveSign guifg=#504945 guibg=#1b2b34
hi! BufferInactiveTarget gui=bold guifg=red guibg=#1b2b34
hi! BufferTabpageFill guifg=#888887 guibg=#1b2b34
hi! BufferTabpages gui=bold guifg=#d7a657 guibg=#1b2b34

hi! LuaTreeFolderName ctermfg=111 guifg=#a7c777
