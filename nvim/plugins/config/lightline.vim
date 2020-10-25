let g:lightline = { }

let g:lightline.colorscheme = 'fans'

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
    \    [ 'filename', 'gitinfo'  ]
    \ ],
    \ 'right': [ [ 'session_status_tracking', 'session_status_paused', 'lineinfo' ],
    \            [ 'fileformat', 'fileencoding', 'filetype', 'percent' ],
    \            [ 'readonly','coc_status' ],
    \          ] }

let g:lightline.enable = {
    \  'tabline': 1
    \ }

let g:lightline.inactive = {
    \ 'left': [ [ 'filename' ] ],
    \ 'right': [ ] }

let g:lightline.tabline = {
    \ 'left': [ [ 'buffers' ] ],
    \ 'right': [ ] }

let g:lightline.component = {
    \ 'lineinfo': ' %3l:%-2v%<'
    \ }

let g:lightline.component_expand = {
    \ 'buffers': 'lightline#bufferline#buffers',
    \ 'session_status_tracking': 'LightlineSessionStatusTacking',
    \ 'session_status_paused': 'LightlineSessionStatusPaused',
    \ }

let g:lightline.component_type = {
    \ 'buffers': 'tabsel',
    \ 'session_status_tracking': 'warning',
    \ 'session_status_paused': 'error'
    \ }

let g:lightline.component_function = {
    \ 'gitinfo': 'LightlineGitStatus',
    \ 'git_buffer_info': 'LightlineGitBufferStatus',
    \ }

let g:lightline#bufferline#show_number     = 2
let g:lightline#bufferline#enable_nerdfont = 0
let g:lightline#bufferline#unnamed         = '[No Name]'

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

function! LightlineSessionStatusTacking() abort
  let session_status = ObsessionStatus('1', '0')
  return session_status == '1' ? '' : ''
endfunction


function! LightlineSessionStatusPaused() abort
  let session_status = ObsessionStatus('1', '0')
  return session_status == '1' ? '' : ''
endfunction


let g:lightline#coc#indicator_warnings = "\uf071 "
let g:lightline#coc#indicator_errors   = "\uf05c "
let g:lightline#coc#indicator_ok       = "\uf058 "

call lightline#coc#register()

