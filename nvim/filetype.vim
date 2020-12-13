augroup filetypedetect

  " Stop newline continuous of comments
  " set formatoptions+=1                      " Don't break lines after a one-letter word
  " set formatoptions-=t                      " Don't auto-wrap text
  " set formatoptions-=o                      " Disable comment-continuation (normal 'o'/'O')
  " set formatoptions+=j                      " Remove comment leader when joining lines
  autocmd FileType * setlocal formatoptions-=cro formatoptions+=j1

  autocmd FileType *.css,*.scss,*.less setlocal iskeyword+=-

  autocmd BufNewFile,BufRead *.md setlocal spell

  " Git
  au BufNewFile,BufRead COMMIT_EDITMSG  setf gitcommit
  au BufNewFile,BufRead MERGE_MSG  setf gitcommit
  au BufNewFile,BufRead *.git/config,.gitconfig,.gitmodules setf gitconfig
  au BufNewFile,BufRead *.git/modules/*/config  setf gitconfig
  au BufNewFile,BufRead git-rebase-todo  setf gitrebase
  au BufNewFile,BufRead .msg.[0-9]*
    \ if getline(1) =~ '^From.*# This line is ignored.$' |
    \   setf gitsendemail |
    \ endif
  au BufNewFile,BufRead *.git/*
    \ if getline(1) =~ '^\x\{40\}\>\|^ref: ' |
    \   setf git |
    \ endif


augroup END


augroup user_persistent_undo
  autocmd!
  au BufWritePre /tmp/*          setlocal noundofile
  au BufWritePre COMMIT_EDITMSG  setlocal noundofile
  au BufWritePre MERGE_MSG       setlocal noundofile
  au BufWritePre *.tmp           setlocal noundofile
  au BufWritePre *.bak           setlocal noundofile
augroup END
