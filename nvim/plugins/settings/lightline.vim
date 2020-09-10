let g:lightline = { }

let g:lightline.colorscheme = 'deus'

" let g:lightline.mode_map = {
"       \   'n' : 'N',
"       \   'i' : 'I',
"       \   'R' : 'R',
"       \   'v' : 'V',
"       \   'V' : 'VL',
"       \   "\<C-v>": 'VB',
"       \   'c' : 'C',
"       \   's' : 'S',
"       \   'S' : 'SL',
"       \   "\<C-s>": 'SB',
"       \   't': 'T',
"       \ }

let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           [ 'readonly', 'filename', 'modified', 'method' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'coc_errors', 'coc_warnings', 'coc_ok', 'coc_status', 'git', 'fileformat', 'fileencoding', 'filetype' ],
    \          ] }

let g:lightline.inactive = {
    \ 'left': [ [ 'filename' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ] ] }

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
    \ 'lineinfo': '%3l:%-2v%<',
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
    \ 'method': 'NearestMethodOrFunction',
    \ 'blame': 'LightlineGitBlame',
    \ 'git': 'LightlineGitStatus'
    \ }

let g:lightline#bufferline#modified        = '*'
let g:lightline#bufferline#show_number     = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unnamed         = '[Untitled]'


function! LightlineGitStatus() abort
  let status = get(g:, 'coc_git_status', '')
  let splited = split(status, '*')
  return len(splited) > 0 ? splited[0] : ''
endfunction

function! LightlineGitBlame() abort
  let blame = get(b:, 'coc_git_blame', '')
  return winwidth(0) > 120 ? blame : ''
endfunction

call lightline#coc#register()
