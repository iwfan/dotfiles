let g:undotree_WindowLayout                    = 4

let g:user_emmet_install_global                = 0
autocmd FileType html,css,jsx,tsx EmmetInstall
let g:user_emmet_mode                          = 'in'
let g:user_emmet_leader_key                    = '<Tab>'

let g:tagalong_verbose = 1

let g:floaterm_width                           = 0.8
let g:floaterm_height                          = 0.8

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx,*.ts'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,typescript'

autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif

let g:vim_jsx_pretty_highlight_close_tag = 1
" let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_microdata_attributes_complete = 0
" let g:html5_aria_attributes_complete = 0

" vim-vue
let g:vue_pre_processors = 'detect_on_enter'
