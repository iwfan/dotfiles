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

let g:which_key_map['1'] = [ ':LuaTreeToggle',                                'File Explorer' ]
let g:which_key_map['2'] = [ ':Vista coc',                                    'Vista Tags' ]
let g:which_key_map['3'] = [ ':CocCommand explorer --toggle --sources=file+', 'File Explorer' ]

let g:which_key_map['8'] = [ ':UndotreeToggle',                               'UndoTree' ]
let g:which_key_map['9'] = 'Git [lazygit]'
nnoremap <silent> <Leader>9 <esc>:tabe<CR>:-tabmove<CR>:term lazygit<CR>
" }}}

" Search And Find And Replace {{{
" ------

let g:which_key_map['?'] = 'search word'
nnoremap <leader>? :CocSearch <C-R>=expand("<cword>")<CR><CR>

let g:which_key_map.f = {
      \ 'name' : '+find & replace',
      \ 'e' : [":CocList --number-select --auto-preview mru",                    'MRU'],
      \ 'b' : [":CocList --number-select  buffers",                              'Buffers'],
      \ 'f' : [":CocList --number-select --auto-preview files",                  'Files'],
      \ 'w' : 'Words',
      \ 'q' : [":CocList --number-select --auto-preview  quickfix",              'Quickfix'],
      \ '?' : [":CocSearch ''.expand('<cword>').'' ",                            'words'],
      \ }

nnoremap <silent> <leader>fw  :exe 'CocList -I --normal --input='.expand('<cword>').' words'<CR>

" }}}

let g:which_key_map.p = [":CocList --number-select --auto-preview yank",         'Yank History']

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
