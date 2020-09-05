""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Functions                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" Stop highlighting when entering Insert mode
"let didit = 0
"autocmd! InsertEnter * if ! didit | call feedkeys("\<C-\>\<C-o>:nohlsearch|let didit = 1\<CR>", 'n') | endif
"autocmd! InsertLeave * let didit = 0

"let W Wq wQ not be error
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang WQ        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file          -bang E         edit<bang> <args>
command! -bar                                  -bang Q         quit<bang>
