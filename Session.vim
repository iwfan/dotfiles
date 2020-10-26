let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +95 nvim/plugins/appearance.vim
badd +77 nvim/core/basic.vim
badd +44 nvim/core/keymappings.vim
badd +4 nvim/plugins/languages.vim
badd +1 nvim/plugins/config/bullets.vim
badd +7 nvim/plugins/config/any-jump.vim
badd +1 nvim/plugins/config/after-object.vim
badd +1 nvim/plugins/config/editorconfig.vim
badd +5 nvim/plugins/config/text-object.vim
badd +3 nvim/plugins/config/text-align.vim
badd +1 nvim/plugins/config/tcomment.vim
badd +1 nvim/plugins/config/startify.vim
badd +1 nvim/plugins/config/search.vim
badd +31 nvim/plugins/config/lightline.vim
badd +9 nvim/plugins/config/indentline.vim
badd +17 nvim/plugins/config/goyo.vim
badd +17 nvim/plugins/config/tools.vim
badd +16 term://.//1182:/bin/zsh
argglobal
%argdel
edit nvim/plugins/config/tools.vim
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
setlocal fdm=marker
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 1 - ((0 * winheight(0) + 20) / 41)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
1
normal! 0
if exists(':tcd') == 2 | tcd ~/dotfiles | endif
tabnext 1
if exists('s:wipebuf') && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 winminheight=1 winminwidth=1 shortmess=filnxtToOFcI
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
let g:this_session = v:this_session
let g:this_obsession = v:this_session
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
