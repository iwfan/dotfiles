nmap s <Plug>(easymotion-s2)
nmap f <Plug>(easymotion-f2)
nmap t <Plug>(easymotion-t2)

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

