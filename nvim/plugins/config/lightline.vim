let g:lightline = { }

let g:lightline.colorscheme = 'deus'

let g:lightline.mode_map = {
    \   'n' : "🅝 ",
    \   'i' : "🅘 ",
    \   'R' : "🅡 ",
    \   'v' : "🅥 ",
    \   'V' : "🅥 ",
    \   "\<C-v>": "🅥 ",
    \   'c' : "🅒 ",
    \   's' : "🅢 ",
    \   'S' : "🅢 ",
    \   "\<C-s>": "🅢 ",
    \   't': "🅣 ",
    \ }

let g:lightline.active = {
    \ 'left': [
    \    [ 'mode', 'paste', 'coc_errors', 'coc_warnings' ],
    \    [ 'gitinfo' ]
    \ ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'fileformat', 'fileencoding', 'filetype', 'percent' ],
    \            [ 'readonly','coc_status' ],
    \          ] }

let g:lightline.inactive = {
    \ 'left': [ [ 'filename' ] ],
    \ 'right': [ ] }

let g:lightline.tabline = {
    \ 'left': [ [ 'buffers' ] ],
    \ 'right': [ [ 'tabs' ] ] }

let g:lightline.component = {
    \ 'mode': '%{lightline#mode()}',
    \ 'absolutepath': '%F',
    \ 'relativepath': '%f',
    \ 'filename': '%t',
    \ 'modified': '%M',
    \ 'bufnum': '%n',
    \ 'paste': '%{&paste?"PASTE":""}',
    \ 'readonly': '%R',
    \ 'charvalue': '%b',
    \ 'charvaluehex': '%B',
    \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
    \ 'fileformat': '%{&ff}',
    \ 'filetype': '%{&ft!=#""?&ft:"no ft"}',
    \ 'percent': '%3p%%',
    \ 'percentwin': '%P',
    \ 'spell': '%{&spell?&spelllang:""}',
    \ 'lineinfo': ' %3l:%-2v%<',
    \ 'line': '%l',
    \ 'column': '%c',
    \ 'close': '%999X X ',
    \ 'winnr': '%{winnr()}' }


let g:lightline.component_expand = {
    \ 'buffers': 'lightline#bufferline#buffers'
    \ }

let g:lightline.component_type = {
    \ 'buffers': 'tabsel'
    \ }

let g:lightline.component_function = {
    \ 'gitinfo': 'LightlineGitStatus',
    \ 'git_buffer_info': 'LightlineGitBufferStatus'
    \ }

let g:lightline#bufferline#show_number     = 2
let g:lightline#bufferline#enable_nerdfont = 0
let g:lightline#bufferline#unnamed         = '[No Name]'
let g:lightline#bufferline#number_map = {
  \ 0: '',
  \ 1: '',
  \ 2: '',
  \ 3: '',
  \ 4: '',
  \ 5: '',
  \ 6: '',
  \ 7: '',
  \ 8: '',
  \ 9: ''
\ }

function! LightlineGitStatus() abort
  let project_status = get(g:, 'coc_git_status', '')
  let buffer_status = get(b:, 'coc_git_status', '')

  let git_branch_info = substitute(trim(project_status), '*', '', '')
  let git_branch_info = substitute(git_branch_info, '…', '', '')
  
  let replaced_buffer_status = substitute(trim(buffer_status), '+', ' ', '')
  let replaced_buffer_status = substitute(replaced_buffer_status, '-', ' ', '')
  let replaced_buffer_status = substitute(replaced_buffer_status, '\~', ' ', '')

  return winwidth(0) > 120 ? replaced_buffer_status . ' ' . git_branch_info : ''
endfunction

let g:lightline#coc#indicator_warnings = "\uf071 "
let g:lightline#coc#indicator_errors   = "\uf05c "
let g:lightline#coc#indicator_ok       = "\uf058 "

call lightline#coc#register()
