"colorscheme gruvbox
"colorscheme onedark
colorscheme deus
set background=dark
let g:enable_bold_font=1
let g:enable_italic_font=1

highlight clear SignColumn              " gutter is the same color as where your line numbers show up

let &t_ut=''
set t_Co=256                            " this fixes colors on OS X terminal
let &t_SI="\<Esc>]50;CursorShape=1\x7"  " chang cursor style in difference mode
let &t_SR="\<Esc>]50;CursorShape=2\x7"  " chang cursor style in difference mode
let &t_EI="\<Esc>]50;CursorShape=0\x7"  " chang cursor style in difference mode

