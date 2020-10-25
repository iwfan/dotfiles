let SessionLoad = 1
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd ~/dotfiles
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +16 nvim/plugins/config/lightline-colorschema.vim
badd +165 zsh/p10k.zsh
badd +3 nvim/plugins/config/indentline.vim
badd +6 nvim/plugins/appearance.vim
badd +135 nvim/plugins/config/coc.vim
badd +12 nvim/advanced/code_run.vim
badd +130 nvim/general/keymappings.vim
badd +1 nvim/plugins/config/bufkill.vim
badd +10 nvim/advanced/keymappings.vim
badd +26 nvim/general/plugins.vim
badd +26 nvim/init.vim
badd +17 nvim/advanced/functions.vim
badd +37 README.md
badd +2 nvim/autoload/helpers.vim
badd +6 nvim/core/functions.vim
badd +11 nvim/core/plugins.vim
badd +7 nvim/core/plugin_keymappings.vim
badd +171 nvim/coc-settings.json
badd +8 nvim/filetype.vim
badd +7 nvim/core/keymappings.vim
badd +13 nvim/ftplugin/markdown_mappings.vim
badd +30 nvim/plugins/behavior.vim
badd +15 nvim/plugins/enhancement.vim
argglobal
%argdel
set splitbelow splitright
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
enew
file \[coc-explorer]-1
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal nofen
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
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
