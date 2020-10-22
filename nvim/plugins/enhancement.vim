" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'josa42/vim-lightline-coc'

" editor enhancement
Plug 'Yggdroot/indentLine'
Plug 'mbbill/undotree'
Plug 'qpkorr/vim-bufkill'

Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'pechorin/any-jump.vim'

" show registers
Plug 'junegunn/vim-peekaboo'

" Tag Management
"Plug 'ludovicchabant/vim-gutentags'
Plug 'liuchengxu/vista.vim'

Plug 'voldikss/vim-floaterm'

Plug 'tpope/vim-unimpaired'
" Git
Plug 'tpope/vim-fugitive'

" General Highlighter
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'RRethy/vim-illuminate'

Plug 'editorconfig/editorconfig-vim'
Plug 'liuchengxu/vim-which-key'

Plug 'yuttie/comfortable-motion.vim'

let g:comfortable_motion_no_default_key_mappings = 1
let g:comfortable_motion_impulse_multiplier = 1  " Feel free to increase/decrease this value.

let g:comfortable_motion_scroll_down_key = "j"
let g:comfortable_motion_scroll_up_key = "k"

nnoremap <silent> <C-d> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 2)<CR>
nnoremap <silent> <C-u> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -2)<CR>
nnoremap <silent> <C-f> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * 4)<CR>
nnoremap <silent> <C-b> :call comfortable_motion#flick(g:comfortable_motion_impulse_multiplier * winheight(0) * -4)<CR>
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
