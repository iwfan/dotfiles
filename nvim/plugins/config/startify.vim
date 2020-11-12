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

