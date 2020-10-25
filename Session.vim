let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +10 nvim/advanced/functions.vim
badd +21 nvim/general/basic.vim
badd +171 nvim/coc-settings.json
badd +10 nvim/filetype.vim
badd +2 nvim/ftplugin/vim.vim
badd +76 nvim/general/keymappings.vim
badd +11 nvim/general/plugins.vim
badd +23 nvim/plugins/enhancement.vim
badd +13 nvim/init.vim
badd +30 nvim/autoload/lightline-colorschema.vim
badd +2 nvim/plugins/config/indentline.vim
badd +3 nvim/plugins/config/lightline.vim
badd +28 nvim/plugins/config/lightline-colorschema.vim
badd +24 nvim/plugins/config/which-key.vim
argglobal
%argdel
edit nvim/plugins/config/lightline-colorschema.vim
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
setlocal fdl=0
setlocal fml=1
setlocal fdn=20
setlocal fen
let s:l = 34 - ((33 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
34
normal! 0
lcd ~/dotfiles
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
