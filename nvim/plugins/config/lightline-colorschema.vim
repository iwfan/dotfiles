let s:term_red = 204
let s:term_green = 114
let s:term_yellow = 180
let s:term_blue = 39
let s:term_purple = 170
let s:term_white = 145
let s:term_black = 235
let s:term_grey = 236

let s:basefg = '#2b2b2b'
let s:basebg = '#343d46'
" let s:basebg = '#2c313c'

let s:lightbg1 = '#a9b7c6'
let s:lightbg2 = '#818e9c'
let s:lightbg3 = '#5c6370'

let s:yellow = '#d19965'
let s:red = '#be5046'
let s:blue = '#56b5c2'
let s:purple = '#c578dd'

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
      \ [ s:basefg, s:blue, s:term_black, s:term_blue, 'bold' ],
      \ s:p.normal.left[1],
      \ s:p.normal.left[2] ]

let s:p.insert.right = s:p.normal.right

let s:p.inactive.right = s:p.normal.right

let s:p.inactive.left = s:p.inactive.right[1:]

let s:p.replace.left = [
      \ [ s:basefg, s:red, s:term_black, s:term_red, 'bold' ],
      \ s:p.normal.left[1],
      \ s:p.normal.left[2] ]

let s:p.replace.right = s:p.normal.right

let s:p.visual.left = [
      \ [ s:basefg, s:purple, s:term_black, s:term_purple, 'bold' ],
      \ s:p.normal.left[1],
      \ s:p.normal.left[2] ]

let s:p.visual.right = s:p.normal.right

let s:p.normal.middle = [ [ s:lightbg1, '#1d2d34', s:term_white, s:term_grey ] ]
let s:p.insert.middle = s:p.normal.middle
let s:p.replace.middle = s:p.normal.middle

let s:p.tabline.left = [ s:p.normal.left[2] ]
let s:p.tabline.tabsel = [ s:p.normal.left[0] ]
let s:p.tabline.middle = s:p.normal.middle
let s:p.tabline.right = [ s:p.normal.left[1] ]

let s:p.normal.error = [ [ '#292c33', s:red, s:term_black, s:term_red ] ]
let s:p.normal.warning = [ [ '#292c33', s:yellow, s:term_black, s:term_yellow ] ]

let g:lightline#colorscheme#fans#palette = lightline#colorscheme#fill(s:p)
