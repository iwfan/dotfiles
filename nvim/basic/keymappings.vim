
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   Mappings                                   "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Caution: Mapping should place before PluginConfigure

nmap <SPACE> <Nop>
let mapleader = "\<SPACE>"

" map CapsLock to Escape

nmap . .`[
nmap s <nop>
nmap ; :

noremap H g^
noremap L g$
noremap J <C-d>zz
noremap K <C-u>zz

noremap n nzz
noremap N Nzz
noremap U <C-r>

noremap ]w g*zz
noremap [w g#zz

" Better indenting
vnoremap < <gv
vnoremap > >gv
nnoremap < <<
nnoremap > >>

nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader><cr> :nohlsearch<CR>


" Window control
nnoremap <leader>t :tabe<CR>                            " open a new tab
nnoremap <leader>v :vnew<CR>                            " close tab
nnoremap <leader>tq :tabclose<CR>

" use ]+space create spaceline
nnoremap [<space>  :<c-u>put! =repeat(nr2char(10), v:count1)<cr>'[
nnoremap ]<space>  :<c-u>put =repeat(nr2char(10), v:count1)<cr>

" Use <C-L> to clear the highlighting of :set hlsearch
if maparg('<C-L>', 'n') ==# ''
    nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif


