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
" function! StartifyEntryFormat()
"   return 'WebDevIconsGetFileTypeSymbol(absolute_path) ." ". entry_path'
" endfunction
" }}}


" ====== vim-matchup {{{
let g:matchup_matchparen_offscreen  = {}
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


" ====== Others {{{
let g:closetag_filenames                  = '*.html,*.xhtml,*.phtml,*.wxml'
let g:closetag_xhtml_filenames            = '*.xhtml,*.jsx,*.js,*.tsx,*.ts'
let g:closetag_filetypes                  = 'html,xhtml,phtml,javascript,typescript'

let g:tagalong_additional_filetypes = ['wxml']
let g:prettier#autoformat = 0
let g:prettier#autoformat_require_pragma = 0

let g:git_messenger_no_default_mappings=1

let g:far#source = 'rg'
" }}}
