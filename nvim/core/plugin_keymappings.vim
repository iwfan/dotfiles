" =========================
" === KeyMappings Setup ===
" =========================
nnoremap <silent><leader><tab> <esc>:BD<cr>
vnoremap <silent><leader><tab> <esc>:BD<cr>

nnoremap <silent> <Leader>0 :FloatermToggle<CR>
tnoremap <silent> <Leader>0 <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <esc><esc> <C-\><C-n>:FloatermKill<CR>

nmap <silent> <Leader>1 <esc>:CocCommand explorer --toggle<cr>
nmap <silent> <Leader>2 <esc>:Vista coc<cr>

nmap <silent> <Leader>8 <esc>:UndotreeToggle<cr>
