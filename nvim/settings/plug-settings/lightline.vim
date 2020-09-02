let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'mode_map': {
      \   'n' : 'N',
      \   'i' : 'I',
      \   'R' : 'R',
      \   'v' : 'V',
      \   'V' : 'VL',
      \   "\<C-v>": 'VB',
      \   'c' : 'C',
      \   's' : 'S',
      \   'S' : 'SL',
      \   "\<C-s>": 'SB',
      \   't': 'T',
      \ },
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'gitbranch', 'readonly', 'filename', 'modified' ]
      \   ]
      \ },
      \ 'tabline': {
      \   'left': [ ['buffers'] ],
      \   'right': [ ['tabs'] ]
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers'
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ 'component': {
      \   'lineinfo': '%3l:%-2v%<'
      \ }
    \ }

let g:lightline#bufferline#modified        = '*'
let g:lightline#bufferline#show_number     = 1
let g:lightline#bufferline#enable_devicons = 1
let g:lightline#bufferline#enable_nerdfont = 1
let g:lightline#bufferline#unnamed         = '[No Name]'

" the following keymap is not working
"nmap <Leader>1 <Plug>lightline#bufferline#go(1)
"nmap <Leader>2 <Plug>lightline#bufferline#go(2)
"nmap <Leader>3 <Plug>lightline#bufferline#go(3)
"nmap <Leader>4 <Plug>lightline#bufferline#go(4)
"nmap <Leader>5 <Plug>lightline#bufferline#go(5)
"nmap <Leader>6 <Plug>lightline#bufferline#go(6)
"nmap <Leader>7 <Plug>lightline#bufferline#go(7)
"nmap <Leader>8 <Plug>lightline#bufferline#go(8)
"nmap <Leader>9 <Plug>lightline#bufferline#go(9)
"nmap <Leader>0 <Plug>lightline#bufferline#go(10)
