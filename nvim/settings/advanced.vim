
" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

" Stop highlighting when entering Insert mode
"let didit = 0
"autocmd! InsertEnter * if ! didit | call feedkeys("\<C-\>\<C-o>:nohlsearch|let didit = 1\<CR>", 'n') | endif
"autocmd! InsertLeave * let didit = 0


"这里嘛。。是用来一键编译代码的
noremap <A-r> :call CompileRunGcc()<CR>
func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
    exec "!g++ % -o %<"
    exec "!time ./%<"
  elseif &filetype == 'cpp'
    set splitbelow
    exec "!g++ -std=c++11 % -Wall -o %<"
    :sp
    :res -10
    :term ./%<
    exec "!rm -rf ./%<"
  elseif &filetype == 'java'
    exec "!javac %"
    exec "!time java %<"
  elseif &filetype == 'sh'
    :!time bash %
  elseif &filetype == 'python'
    set splitbelow
    :sp
    :term python3 %
  elseif &filetype == 'html'
    silent! exec "!" google-chrome-stable " % &"
  elseif &filetype == 'markdown'
    exec "InstantMarkdownPreview"
  elseif &filetype == 'tex'
    silent! exec "VimtexStop"
    silent! exec "VimtexCompile"
  elseif &filetype == 'dart'
    exec "CocCommand flutter.run -d ".g:flutter_default_device
    CocCommand flutter.dev.openDevLog
  elseif &filetype == 'javascript'
    set splitbelow
    :sp
    :term export DEBUG="INFO,ERROR,WARNING"; node --trace-warnings .
  elseif &filetype == 'go'
    set splitbelow
    :sp
    :term go run .
  endif
endfunc
