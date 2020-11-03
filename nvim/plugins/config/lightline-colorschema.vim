let s:term_red = 204
let s:term_green = 114
let s:term_yellow = 180
let s:term_blue = 39
let s:term_purple = 170
let s:term_white = 145
let s:term_black = 235
let s:term_grey = 236

let s:basefg = '#2b2b2b'
let s:basebg = '#3e4452'
let s:lightbg1 = '#a9b7c6'
let s:lightbg2 = '#818e9c'
let s:lightbg3 = '#5c6370'

let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

let s:p.normal.left = [
      \ [ s:basefg, s:lightbg1, s:term_black, s:term_green, 'bold' ],
      \ [ s:basefg, s:lightbg2, s:term_black, s:term_blue ],
      \ [ s:lightbg1, s:lightbg3, s:term_green, s:term_black ] ]

let s:p.normal.right = [
      \ [ s:basefg, s:lightbg1, s:term_black, s:term_green ],
      \ [ s:basefg, s:lightbg2, s:term_white, s:term_grey ],
      \ [ s:lightbg1, s:lightbg3, s:term_green, s:term_black ] ]

let s:p.insert.left = [
      \ [ s:basefg, '#61afef', s:term_black, s:term_blue, 'bold' ],
      \ s:p.normal.left[1],
      \ s:p.normal.left[2] ]

let s:p.insert.right = s:p.normal.right

let s:p.inactive.right = s:p.normal.right

let s:p.inactive.left = s:p.inactive.right[1:]

let s:p.replace.left = [
      \ [ '#292c33', '#e06c75', s:term_black, s:term_red, 'bold' ],
      \ [ '#e06c75', '#3e4452', s:term_red, s:term_black ] ]

let s:p.replace.right = s:p.normal.right

let s:p.visual.left = [
      \ [ '#292c33', '#c678dd', s:term_black, s:term_purple, 'bold' ],
      \ [ '#c678dd', '#3e4452', s:term_purple, s:term_black ] ]

let s:p.visual.right = s:p.normal.right

let s:p.normal.middle = [ [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ] ]
let s:p.insert.middle = s:p.normal.middle

let s:p.replace.middle = s:p.normal.middle
let s:p.tabline.left = [ [ '#abb2bf', '#3e4452', s:term_white, s:term_grey ] ]
let s:p.tabline.tabsel = [ s:p.normal.left[0] ]
let s:p.tabline.middle = s:p.normal.middle
let s:p.tabline.right = [ s:p.normal.left[1] ]
let s:p.normal.error = [ [ '#292c33', '#e06c75', s:term_black, s:term_red ] ]
let s:p.normal.warning = [ [ '#292c33', '#e5c07b', s:term_black, s:term_yellow ] ]

let g:lightline#colorscheme#fans#palette = lightline#colorscheme#fill(s:p)
