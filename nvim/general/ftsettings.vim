" Stop newline continuous of comments
" set formatoptions+=1                      " Don't break lines after a one-letter word
" set formatoptions-=t                      " Don't auto-wrap text
" set formatoptions-=o                      " Disable comment-continuation (normal 'o'/'O')
" set formatoptions+=j                      " Remove comment leader when joining lines
autocmd FileType * setlocal formatoptions-=cro formatoptions+=j1

autocmd FileType *.css,*.scss,*.less setlocal iskeyword+=-

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END


augroup user_persistent_undo
  autocmd!
  au BufWritePre /tmp/*          setlocal noundofile
  au BufWritePre COMMIT_EDITMSG  setlocal noundofile
  au BufWritePre MERGE_MSG       setlocal noundofile
  au BufWritePre *.tmp           setlocal noundofile
  au BufWritePre *.bak           setlocal noundofile
augroup END
