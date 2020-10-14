"Indentline设置
let g:indentLine_enabled         = 1
let g:indentLine_char            = '┆'
let g:indentLine_fileTypeExclude = ['defx', 'denite','startify','tagbar','vista_kind','vista','coc-explorer','dashboard']
" let g:indentLine_setColors       = 0

" So that I can see `` in markdown files
autocmd FileType markdown :IndentLinesDisable

