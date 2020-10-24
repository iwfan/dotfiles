let g:startify_lists = [
      \ { 'type': 'files',     'header': ['   Files']            },
      \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

let g:startify_bookmarks = [
      \ { 'i': '~/.config/nvim/init.vim' },
      \ { 'z': '~/.zshrc' },
      \ { 't': '~/.tmux.conf' },
      \ ]

let g:startify_commands = [
      \ ['Vim Reference', 'h ref'],
      \ {'m': ['My magical function', 'call Magic()']},
      \ ]

let g:startify_session_before_save = [
      \ 'echo "Cleaning up before saving.."',
      \ ]

let g:startify_skiplist = [
      \ 'COMMIT_EDITMSG',
      \ ]

let g:startify_session_autoload    = 1
let g:startify_session_persistence = 1
let g:startify_session_delete_buffers = 1
let g:startify_files_number        = 5
let g:startify_custom_indices      = map(range(1,100), 'string(v:val)')
let g:startify_enable_special      = 0
let g:startify_change_to_vcs_root  = 1
let g:startify_fortune_use_unicode = 1

