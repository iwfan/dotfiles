let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1

let g:sneak#s_next = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
" xmap s <Plug>Sneak_s
" xmap S <Plug>Sneak_S
" omap s <Plug>Sneak_s
" omap S <Plug>Sneak_S
nmap f <Plug>(easymotion-f)
nmap F <Plug>(easymotion-F)
xmap f <Plug>(easymotion-f)
xmap f <Plug>(easymotion-f)
omap F <Plug>(easymotion-F)
omap F <Plug>(easymotion-F)
nmap t <Plug>(easymotion-t)
nmap T <Plug>(easymotion-T)
xmap t <Plug>(easymotion-t)
xmap T <Plug>(easymotion-T)
omap t <Plug>(easymotion-t)
omap T <Plug>(easymotion-T)

let g:incsearch#auto_nohlsearch = 1
let g:EasyMotion_smartcase = 1

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

map g/ <Plug>(incsearch-easymotion-/)
map g? <Plug>(incsearch-easymotion-?)

map z/ <Plug>(incsearch-stay)
map zg/ <Plug>(incsearch-easymotion-stay)

map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)
map ]w <Plug>(incsearch-nohl-g*)
map [w <Plug>(incsearch-nohl-g#)

