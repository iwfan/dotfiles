Plug 'sheerun/vim-polyglot'

" === html Plugins === "
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

" === css Plugins === "
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'javascript','javascriptreact' ] }

" === Javascript Plugins === "
Plug 'moll/vim-node'

Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Json Plugins === "
" Plug 'neoclide/jsonc.vim' , { 'for': [ 'json','jsonc' ] }

" === markdown Plugins === "
Plug 'godlygeek/tabular'

" === code format === ""
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
