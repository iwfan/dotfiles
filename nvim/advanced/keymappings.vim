" =========================
" === KeyMappings Setup ===
" =========================

"map R :w<cr>:source $MYVIMRC<cr>



"nmap \c <Plug>NERDCommenterToggle

"nmap <Leader>g :FloatermNew lazygit<CR>
"nmap <Leader>0 :FloatermNew<CR>

nnoremap <silent> <Leader>0 :FloatermToggle<CR>
tnoremap <silent> <Leader>0 <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <esc><esc> <C-\><C-n>:FloatermKill<CR>

nmap <silent> <Leader>1 <esc>:CocCommand explorer --toggle<cr>
nmap <silent> <Leader>2 <esc>:Vista!!<cr>

let g:vista#renderer#enable_icon = 1
"let g:vista_disable_statusline = 1
let g:vista_default_executive = 'ctags'
"let g:vista_echo_cursor_strategy = 'floating_win'
"let g:vista_vimwiki_executive = 'markdown'
"let g:vista_executive_for = {
"			\ 'vimwiki': 'markdown',
"			\ 'pandoc': 'markdown',
"			\ 'markdown': 'toc',
"			\ 'yaml': 'coc',
"			\ 'typescript': 'coc',
"			\ 'typescriptreact': 'coc',
"			\ }
let g:vista_fzf_preview = ['right:50%']

nmap <silent> <Leader>8 <esc>:UndotreeToggle<cr>
