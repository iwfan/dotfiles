call textobj#user#plugin('braces', {
\   'angle': {
\     'pattern': ['<<', '>>'],
\     'select-a': 'aA',
\     'select-i': 'iA',
\   },
\ })

call textobj#user#plugin('tag', {
\   'keyValA': {
\     'pattern': '\v *(\([^()]+\)|\[[^[]]+\]|[^ ]+)\=(''[^'']*''|"[^"]*")',
\     'select': ['ak'],
\   },
\   'keyValI': {
\     'pattern': '\v(\([^()]+\)|\[[^[]]+\]|[^ ]+)\=(''[^'']*''|"[^"]*")',
\     'select': ['ik'],
\   },
\ })

autocmd VimEnter * call after_object#enable('=', ':', '-', '#', ' ', '.', ';', '/', '\', ']', ')', '}')

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
