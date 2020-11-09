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
Plug 'neoclide/jsonc.vim'

" === markdown Plugins === "
Plug 'plasticboy/vim-markdown', {'for': 'markdown'}
Plug 'dkarter/bullets.vim', {'for': 'markdown'}

" Go
Plug 'fatih/vim-go' , { 'for': ['go', 'vim-plug'], 'tag': '*' }

" === code format === ""
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'javascriptreact', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }

let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0

" ===
" === vim-go
" ===
let g:go_echo_go_info = 0
let g:go_doc_popup_window = 1
let g:go_def_mapping_enabled = 0
let g:go_template_autocreate = 0
let g:go_textobj_enabled = 0
let g:go_auto_type_info = 1
let g:go_def_mapping_enabled = 0
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_functions = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_space_tab_error = 1
let g:go_highlight_string_spellcheck = 1
let g:go_highlight_structs = 1
let g:go_highlight_trailing_whitespace_error = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_assignments = 0
let g:go_highlight_variable_declarations = 0
let g:go_doc_keywordprg_enabled = 0
