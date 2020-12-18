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

let g:startify_session_dir = '~/.config/nvim/session'
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_persistence = 1

let g:startify_files_number        = 5
let g:startify_custom_indices      = map(range(1,100), 'string(v:val)')
let g:startify_enable_special      = 1
let g:startify_change_to_vcs_root  = 1
let g:startify_fortune_use_unicode = 1

" show icon
function! StartifyEntryFormat()
  return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
endfunction
" }}}

" ====== barbar {{{
" NOTE: This variable doesn't exist before barbar runs. Create it before
"       setting any option.
let bufferline = {}

" Enable/disable animations
let bufferline.animation = v:true

" Enable/disable icons
" if set to 'numbers', will show buffer index in the tabline
" if set to 'both', will show buffer index and icons in the tabline
let bufferline.icons = v:true

" Configure icons on the bufferline.
let bufferline.icon_separator_active = '▎'
let bufferline.icon_separator_inactive = '▎'
let bufferline.icon_close_tab = ''
let bufferline.icon_close_tab_modified = '●'

" Enable/disable close button
let bufferline.closable = v:true

" Enables/disable clickable tabs
"  - left-click: go to buffer
"  - middle-click: delete buffer
let bufferline.clickable = v:true

" If set, the letters for each buffer in buffer-pick mode will be
" assigned based on their name. Otherwise or in case all letters are
" already assigned, the behavior is to assign letters in order of
" usability (see order below)
let bufferline.semantic_letters = v:true

" New buffer letters are assigned in this order. This order is
" optimal for the qwerty keyboard layout but might need adjustement
" for other layouts.
let bufferline.letters =
  \ 'asdfjkl;ghnmxcbziowerutyqpASDFJKLGHNMXCBZIOWERUTYQP'

" Sets the maximum padding width with which to surround each tab
let bufferline.maximum_padding = 4
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

" ====== easy-align {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" }}}

" ====== editor-config {{{
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" }}}

" ====== vim-bullets {{{
let g:bullets_enabled_file_types      = [
    \ 'markdown',
    \ 'text',
    \ 'gitcommit',
    \ 'scratch'
    \]
let g:bullets_set_mappings            = 0 " default = 1
let g:bullets_enable_in_empty_buffers = 0 " default = 1
" }}}

" ====== html {{{

" let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete      = 0
let g:html5_microdata_attributes_complete = 0
" let g:html5_aria_attributes_complete = 0

let g:closetag_filenames                  = '*.html,*.xhtml,*.phtml,*.wxml'
let g:closetag_xhtml_filenames            = '*.xhtml,*.jsx,*.js,*.tsx,*.ts'
let g:closetag_filetypes                  = 'html,xhtml,phtml,javascript,typescript'

let g:tagalong_additional_filetypes = ['wxml']

let g:vim_jsx_pretty_highlight_close_tag  = 1
" }}}

" ====== polyglot {{{
let g:python_highlight_all=1

let g:vim_jsx_pretty_colorful_config = 1
" }}}

" ====== Others {{{
autocmd User Node
  \ if &filetype == "javascript" |
  \   nmap <buffer> <C-w>f <Plug>NodeVSplitGotoFile |
  \   nmap <buffer> <C-w><C-f> <Plug>NodeVSplitGotoFile |
  \ endif
" vim-vue
let g:vue_pre_processors = 'detect_on_enter'

let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0
" }}}
