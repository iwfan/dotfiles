" ====== vim-xtabline
let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['buffers', 'tabs']
let g:xtabline_settings.enable_persistance = 1
let g:xtabline_settings.last_open_first = 0

" ====== vim-matchup
let g:matchup_matchparen_offscreen  = {}

" ====== vim-tcomment
let g:tcomment_maps = 0
xmap <silent> gc  <Plug>TComment_gc
nmap <silent> gc  <Plug>TComment_gc
omap <silent> gc  <Plug>TComment_gc
xmap <silent> gcb <Plug>TComment_gcb
nmap <silent> gcb <Plug>TComment_gcb
omap <silent> gcb <Plug>TComment_gcb
nmap <silent> gcc <Plug>TComment_gcc
xmap <silent> gcc <Plug>TComment_gcc
omap <silent> gcc <Plug>TComment_gcc
map <silent> <C-_> :TComment<cr>
imap <silent> <C-_> <esc>:TComment<cr>a

" ====== vim-sandwich
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

let g:undotree_WindowLayout = 4

let g:tagalong_verbose      = 1

let g:floaterm_width        = 0.8
let g:floaterm_height       = 0.8

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
