let g:sneak#label = 1
" case insensitive sneak
let g:sneak#use_ic_scs = 1

let g:sneak#s_next = 1
nmap s <Plug>Sneak_s
nmap S <Plug>Sneak_S
xmap s <Plug>Sneak_s
xmap S <Plug>Sneak_S
omap s <Plug>Sneak_s
omap S <Plug>Sneak_S
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

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

