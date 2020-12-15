" Which Key Settings {{{
" ------
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
let g:which_key_map =  {}
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}
" Hide status line
autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 noshowmode ruler
" }}}

" Tools {{{
" ------

let g:which_key_map['0'] = [   ':FloatermToggle',                             'Terminal' ]
tnoremap <silent> <Leader>0 <C-\><C-n>:FloatermToggle<CR>
tnoremap <silent> <esc><esc> <C-\><C-n>:FloatermKill<CR>

let g:which_key_map['1'] = [ ':CocCommand explorer --toggle --sources=file+', 'File Explorer' ]
let g:which_key_map['2'] = [ ':Vista coc',                                    'Vista Tags' ]

let g:which_key_map['8'] = [ ':UndotreeToggle',                               'UndoTree' ]
let g:which_key_map['9'] = 'Git [lazygit]'
nnoremap <silent> <Leader>9 <esc>:tabe<CR>:-tabmove<CR>:term lazygit<CR>
" }}}


" Search And Find And Replace {{{
" ------

let g:which_key_map['?'] = 'search word'
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>

nnoremap <silent> <space>ff  :<C-u>CocList --number-select --auto-preview files<cr>
" nnoremap <silent> <space>fw  :<C-u>CocList --number-select --auto-preview --ignore-case words<cr>
nnoremap <silent> <space>fe  :<C-u>CocList --number-select --auto-preview mru<cr>
nnoremap <silent> <space>fb  :<C-u>CocList --number-select buffers<cr>
nnoremap <silent> <space>fw  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>
nnoremap <silent> <space>fq  :<C-u>CocList --number-select --auto-preview quickfix<cr>
nnoremap <silent> <space>p  :<C-u>CocList --number-select --auto-preview yank<cr>

let g:which_key_map.f = {
      \ 'name' : '+buffer' ,
      \ '1' : ['b1'        , 'buffer 1']        ,
      \ '2' : ['b2'        , 'buffer 2']        ,
      \ 'd' : ['bd'        , 'delete-buffer']   ,
      \ 'f' : ['bfirst'    , 'first-buffer']    ,
      \ 'h' : ['Startify'  , 'home-buffer']     ,
      \ 'l' : ['blast'     , 'last-buffer']     ,
      \ 'n' : ['bnext'     , 'next-buffer']     ,
      \ 'p' : ['bprevious' , 'previous-buffer'] ,
      \ '?' : ['Buffers'   , 'fzf-buffer']      ,
      \ }
" }}}

nnoremap <silent> <leader>oq  :copen<CR>
nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o = {
      \ 'name' : '+open',
      \ 'q' : 'open-quickfix'    ,
      \ 'l' : 'open-locationlist',
      \ }


call which_key#register('<Space>', "g:which_key_map")
" Map leader to which_key
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
