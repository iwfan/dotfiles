" ====== startify {{{
let g:startify_lists = [
      \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ ]

let g:startify_bookmarks = [
      \ { 'i': ' ~/dotfiles/hammerspoon/config.lua ' },
      \ { 'z': '~/.zshrc' },
      \ { 't': '~/.tmux.conf' },
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ ]

" let g:startify_padding_left        = (winwidth(0) / 2) - 30
let g:startify_files_number        = 5
let g:startify_custom_indices      = map(range(1,100), 'string(v:val)')
let g:startify_enable_special      = 1
let g:startify_change_to_vcs_root  = 1
let g:startify_fortune_use_unicode = 1
" }}}

" ====== vim-xtabline {{{
let g:xtabline_settings = {}
" let g:xtabline_settings.enable_mappings = 0
let g:xtabline_settings.tabline_modes = ['buffers', 'tabs']
let g:xtabline_settings.enable_persistance = 1
let g:xtabline_settings.last_open_first = 0
" }}}

" ====== indent-line {{{
let g:indentLine_enabled         = 1
let g:indentLine_char            = '┆'
let g:indentLine_fileTypeExclude = ['defx', 'denite', 'startify', 'tagbar', 'vista_kind', 'vista', 'coc-explorer', 'dashboard']
" let g:indentLine_setColors       = 0

" So that I can see `` in markdown files
autocmd FileType markdown :IndentLinesDisable
" }}}

" ====== vim-matchup {{{
let g:matchup_matchparen_offscreen  = {}
" }}}

" ====== vim-tcomment {{{
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
" }}}

" ====== vim-sandwich {{{
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
" }}}

" ====== context.vim {{{
let g:context_filetype_blacklist = [ 'coc-explorer' ]
" }}}

" ====== undotree {{{
let g:undotree_WindowLayout = 4
" }}}

" ====== floatterm {{{
let g:floaterm_width        = 0.8
let g:floaterm_height       = 0.8
" }}}

" ====== text-object-user {{{
call textobj#user#plugin('braces', {
      \   'angle': {
      \     'pattern': ['<<', '>>'],
      \     'select-a': 'aA',
      \     'select-i': 'iA',
      \   },
      \ })

call textobj#user#plugin('tag', {
      \   'keyValA': {
      \     'pattern': '\v *(\([^()]+\)|\[[^[]]+\]|[^ ]+)\=(''[^'']*''|"[^"]*")',
      \     'select': ['ak'],
      \   },
      \   'keyValI': {
      \     'pattern': '\v(\([^()]+\)|\[[^[]]+\]|[^ ]+)\=(''[^'']*''|"[^"]*")',
      \     'select': ['ik'],
      \   },
      \ })
" }}}

" ====== after-object {{{
autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '.', ';', '/', '\', ']', ')', '}')
" }}}

" ====== easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" ====== editor-config {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}

" ==== vim-bullets {{{
let g:bullets_enabled_file_types      = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
let g:bullets_set_mappings            = 0 " default = 1
let g:bullets_enable_in_empty_buffers = 0 " default = 1
" }}}

" ====== Others {{{
let g:tagalong_verbose      = 1

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
" }}}
