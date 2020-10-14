let g:lightline = { }

" let g:lightline.colorscheme = 'deus'
let g:lightline.colorscheme = 'nord'

let g:lightline.mode_map = {
    \ 'n' : 'N',
    \ 'i' : 'I',
    \ 'R' : 'R',
    \ 'v' : 'V',
    \ 'V' : 'VL',
    \ "\<C-v>": 'VB',
    \ 'c' : 'C',
    \ 's' : 'S',
    \ 'S' : 'SL',
    \ "\<C-s>": 'SB',
    \ 't': 'T',
    \ }

let g:lightline.active = {
    \ 'left': [
    \    [ 'mode', 'paste', 'coc_errors', 'coc_warnings', 'coc_ok' ],
    \    [ 'gitinfo', 'git_buffer_info' ]
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
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unnamed         = '[No Name]'

function! LightlineGitStatus() abort
  let project_status = get(g:, 'coc_git_status', '')
  return winwidth(0) > 120 ? trim(project_status) : ''
endfunction

function! LightlineGitBufferStatus() abort
  let buffer_status = get(b:, 'coc_git_status', '')
  return winwidth(0) > 120 ? trim(buffer_status) : ''
endfunction

let g:lightline#coc#indicator_warnings = "\uf071 "
let g:lightline#coc#indicator_errors   = "\uf05c "
let g:lightline#coc#indicator_ok       = "\uf058 "

call lightline#coc#register()
