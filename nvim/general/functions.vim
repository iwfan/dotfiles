""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Functions                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

augroup filetypedetect
  autocmd!
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

  " set filetypes as typescriptreact
  autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
augroup END

augroup user_persistent_undo
  autocmd!
  au BufWritePre /tmp/*          setlocal noundofile
  au BufWritePre COMMIT_EDITMSG  setlocal noundofile
  au BufWritePre MERGE_MSG       setlocal noundofile
  au BufWritePre *.tmp           setlocal noundofile
  au BufWritePre *.bak           setlocal noundofile
augroup END

augroup filetype_config
  autocmd!
  autocmd FileType * setlocal formatoptions-=cro formatoptions+=j1
  autocmd FileType *.css,*.scss,*.less setlocal iskeyword+=-
  autocmd FileType *.md setlocal wrap
augroup END

" Get the exit status from a terminal buffer by looking for a line near the end
" of the buffer with the format, '[Process exited ?]'.
func! s:getExitStatus() abort
  let ln = line('$')
  " The terminal buffer includes several empty lines after the 'Process exited'
  " line that need to be skipped over.
  while ln >= 1
    let l = getline(ln)
    let ln -= 1
    let exitCode = substitute(l, '^\[Process exited \([0-9]\+\)\]$', '\1', '')
    if l != '' && l == exitCode
      " The pattern did not match, and the line was not empty. It looks like
      " there is no process exit message in this buffer.
      break
    elseif exitCode != ''
      return str2nr(exitCode)
    endif
  endwhile
  throw 'Could not determine exit status for buffer, ' . expand('%')
endfunc

func! s:afterTermClose() abort
  if s:getExitStatus() == 0
    bdelete!
  endif
endfunc

augroup Neoterm
  autocmd!
  autocmd TermOpen term://* startinsert
  " The line '[Process exited ?]' is appended to the terminal buffer after the
  " `TermClose` event. So we use a timer to wait a few milliseconds to read the
  " exit status. Setting the timer to 0 or 1 ms is not sufficient; 20 ms seems
  " to work for me.
  autocmd TermClose * call timer_start(20, { -> s:afterTermClose() })
augroup END

let ftToIgnore = ['markdown', 'text']

" augroup completion
"   autocmd!
"   " Enable completion for most buffers
"   autocmd BufWritePre * if index(ftToIgnore, &ft) < 0 | lua require'completion'.on_attach()
" augroup END

augroup windows
  " Resize windows on move
  autocmd VimResized * :wincmd =
  " Split help windows vertically, on the right
  autocmd FileType help wincmd L
augroup END

augroup external
  " Open images in an image viewer (probably Preview)
  autocmd BufEnter *.png,*.jpg,*.gif exec "silent !open ".expand("%") | :bw
augroup END

augroup editing
  " Highlight yanks
  au TextYankPost * silent! lua vim.highlight.on_yank {timeout=500}
augroup END

"let W Wq wQ not be error
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang WQ        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file          -bang E         edit<bang> <args>
command! -bar                                  -bang Q         quit<bang>
" Use Obs instead of Obsession
command! -bar -bang -complete=file -nargs=* Obs
      \ Obsession<bang> <args> |
      \ call lightline#update()
