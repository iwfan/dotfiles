
nnoremap <silent> <space>ff  :<C-u>CocList --number-select --auto-preview files<cr>
" nnoremap <silent> <space>fw  :<C-u>CocList --number-select --auto-preview --ignore-case words<cr>
nnoremap <silent> <space>fe  :<C-u>CocList --number-select --auto-preview mru<cr>
nnoremap <silent> <space>fw  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent> <space>p  :<C-u>CocList --number-select --auto-preview yank<cr>