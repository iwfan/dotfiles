" === html Plugins === "
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'alvan/vim-closetag'
Plug 'AndrewRadev/tagalong.vim'

" === css Plugins === "
Plug 'hail2u/vim-css3-syntax', { 'for': [ 'css', 'javascript','javascriptreact' ] }
Plug 'cakebaker/scss-syntax.vim', { 'for': [ 'sass','scss' ] }
Plug 'iloginow/vim-stylus', { 'for': 'stylus' }

" === Javascript Plugins === "
" Plug 'yuezk/vim-js', { 'for': [ 'javascript','javascriptreact' ] }
" Plug 'pangloss/vim-javascript'
Plug 'neoclide/vim-jsx-improve', { 'for': [ 'javascript','javascriptreact' ] }
Plug 'moll/vim-node'

" Plug 'HerringtonDarkholme/yats.vim', { 'for': [ 'typescript','typescriptreact' ] }
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

Plug 'posva/vim-vue', { 'for': 'vue' }

" === Json Plugins === "
Plug 'neoclide/jsonc.vim' , { 'for': [ 'json','jsonc' ] }

" === markdown Plugins === "
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}

" === code format === ""
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
