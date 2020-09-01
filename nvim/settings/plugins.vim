" ====================
" === Plugin Setup ===
" ====================

" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
 silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
 autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" theme
"美化插件
Plug 'morhetz/gruvbox'
Plug 'hardcoreplayers/spaceline.vim'
"Plug 'hardcoreplayers/vim-buffet'
Plug 'bagrat/vim-buffet'
Plug 'ryanoasis/vim-devicons'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'Yggdroot/indentLine'


Plug 'mbbill/undotree'
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'terryma/vim-multiple-cursors'
Plug 'luochen1990/rainbow'

Plug 'metalelf0/supertab'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'junegunn/vim-easy-align', {'on':'<Plug>(EasyAlign)'}
Plug 'voldikss/vim-translator', { 'on':'<Plug>Translate' }
Plug 'kristijanhusak/defx-git', {'on':'Defx'}
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins'}
Plug 'kristijanhusak/defx-icons'
Plug 'junegunn/fzf', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks'] }
Plug 'junegunn/fzf.vim', {'on':['Files', 'History', 'Colors', 'Rg', 'Marks']}

Plug 'scrooloose/nerdcommenter'

Plug 'mattn/emmet-vim'

" Intellisense Engine
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Denite - Fuzzy finding, buffer management
Plug 'Shougo/denite.nvim'

" Snippet support
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

" Print function signatures in echo area
Plug 'Shougo/echodoc.vim'

" === Javascript Plugins === "
" Typescript syntax highlighting
Plug 'HerringtonDarkholme/yats.vim'

" ReactJS JSX syntax highlighting
Plug 'mxw/vim-jsx'

" Generate JSDoc commands based on function signature
Plug 'heavenshell/vim-jsdoc'

" === Syntax Highlighting === "

" Syntax highlighting for javascript libraries
Plug 'othree/javascript-libraries-syntax.vim'

" Improved syntax highlighting and indentation
Plug 'othree/yajs.vim'
call plug#end()


" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


let g:EasyMotion_smartcase = 1

let g:undotree_WindowLayout = 3

let g:user_emmet_install_global = 0
autocmd FileType html,css,jsx,tsx EmmetInstall
let g:user_emmet_mode='in'
let g:user_emmet_leader_key='<Tab>'

let g:rainbow_active = 1


nmap <leader>1 <Plug>BuffetSwitch(1)
nmap <leader>2 <Plug>BuffetSwitch(2)
nmap <leader>3 <Plug>BuffetSwitch(3)
nmap <leader>4 <Plug>BuffetSwitch(4)
nmap <leader>5 <Plug>BuffetSwitch(5)
nmap <leader>6 <Plug>BuffetSwitch(6)
nmap <leader>7 <Plug>BuffetSwitch(7)
nmap <leader>8 <Plug>BuffetSwitch(8)
nmap <leader>9 <Plug>BuffetSwitch(9)
nmap <leader>0 :exec "echo 'adhwadwada'"

"FZF模糊搜索设置
" nmap <C-z> :<C-u>SessionSave<CR>
" nmap <C-x> :<C-u>SessionLoad<CR>
" nnoremap <silent> <C-h> :History<CR>
" nnoremap <silent> <C-p> :Files<CR>
" nnoremap <silent> <C-t> :Colors<CR>
" nnoremap <silent> <C-f> :Rg<CR>
" nnoremap <silent> <C-m> :Marks<CR>

nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nmap <Leader>cn :<C-u>DashboardNewFile<CR>
nnoremap <silent> <Leader>fh :History<CR>
nnoremap <silent> <Leader>ff :Files<CR>
nnoremap <silent> <Leader>tc :Colors<CR>
nnoremap <silent> <Leader>fa :Rg<CR>
nnoremap <silent> <Leader>fb :Marks<CR>

let g:fzf_preview_window = 'right:60%'
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

function! s:list_buffers()
	redir => list
	silent ls
	redir END
	return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
	execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
			\ 'source': s:list_buffers(),
			\ 'sink*': { lines -> s:delete_buffers(lines) },
			\ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
			\ }))

noremap <c-d> :BD<CR>

let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }

"Defx设置
noremap <LEADER>fe :Defx<CR>

call defx#custom#option('_', {
			\ 'resume': 1,
			\ 'winwidth': 30,
			\ 'split': 'vertical',
			\ 'direction': 'topleft',
			\ 'show_ignored_files': 0,
			\ 'columns': 'mark:indent:git:icons:filename',
			\ 'root_marker': '',
			\ })

call defx#custom#column('git', {
			\   'indicators': {
			\     'Modified'  : '•',
			\     'Staged'    : '✚',
			\     'Untracked' : 'ᵁ',
			\     'Renamed'   : '≫',
			\     'Unmerged'  : '≠',
			\     'Ignored'   : 'ⁱ',
			\     'Deleted'   : '✖',
			\     'Unknown'   : '⁇'
			\   }
			\ })

call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })

augroup user_plugin_defx
	autocmd!
	autocmd FileType defx call <SID>defx_mappings()
	autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif
	autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif
augroup END

function! s:jump_dirty(dir) abort
	let l:icons = get(g:, 'defx_git_indicators', {})
	let l:icons_pattern = join(values(l:icons), '\|')

	if ! empty(l:icons_pattern)
		let l:direction = a:dir > 0 ? 'w' : 'bw'
		return search(printf('\(%s\)', l:icons_pattern), l:direction)
	endif
endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_mappings() abort
	setlocal signcolumn=no expandtab
	nnoremap <silent><buffer><expr> <CR>     <SID>defx_toggle_tree()                    " 打开或者关闭文件夹，文件
	nnoremap <silent><buffer><expr> <C-h>     defx#do_action('toggle_ignored_files')     " 显示隐藏文件
	nnoremap <silent><buffer><expr> c defx#do_action('copy')
	nnoremap <silent><buffer><expr> m defx#do_action('move')
	nnoremap <silent><buffer><expr> p defx#do_action('paste')
	nnoremap <silent><buffer><expr> d defx#do_action('open')
	nnoremap <silent><buffer><expr> K defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N defx#do_action('new_file')
	nnoremap <silent><buffer><expr> M defx#do_action('new_multiple_files')
	nnoremap <silent><buffer><expr> C defx#do_action('toggle_columns', 'mark:indent:icon:filename:type:size:time')
	nnoremap <silent><buffer><expr> S defx#do_action('toggle_sort', 'time')
	nnoremap <silent><buffer><expr> x defx#do_action('remove')
	nnoremap <silent><buffer><expr> r defx#do_action('rename')
	nnoremap <silent><buffer><expr> ! defx#do_action('execute_command')
	nnoremap <silent><buffer><expr> l defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> yy defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> <C-h> defx#do_action('toggle_ignored_files')
	nnoremap <silent><buffer><expr> ; defx#do_action('repeat')
	nnoremap <silent><buffer><expr> a defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~ defx#do_action('cd')
	nnoremap <silent><buffer><expr> q defx#do_action('quit')
	nnoremap <silent><buffer><expr> <Space> defx#do_action('toggle_select') . 'j'
	nnoremap <silent><buffer><expr> * defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr> j line('.') == line('$') ? 'gg' : 'j'
	nnoremap <silent><buffer><expr> k line('.') == 1 ? 'G' : 'k'
	nnoremap <silent><buffer><expr> <C-g> defx#do_action('print')
	nnoremap <silent><buffer><expr> cd defx#do_action('change_vim_cwd')
	nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
	nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
	nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])

endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

function! s:defx_toggle_tree() abort
	if defx#is_directory()
		return defx#do_action('open_or_close_tree')
	endif
	return defx#do_action('multi', ['drop'])
endfunction

let g:defx_icons_column_length = 2
let g:defx_icons_mark_icon = ''
let g:defx_icons_parent_icon = ""
"Dashboard设置
let g:dashboard_custom_header = [
			\ '',
			\ '███████╗██╗   ██╗ ██████╗ ██╗    ██╗   ██╗███████╗    ██╗',
			\ '██╔════╝██║   ██║██╔═══██╗██║    ██║   ██║██╔════╝    ██║',
			\ '█████╗  ██║   ██║██║   ██║██║    ██║   ██║█████╗      ██║',
			\ '██╔══╝  ╚██╗ ██╔╝██║   ██║██║    ╚██╗ ██╔╝██╔══╝      ╚═╝',
			\ '███████╗ ╚████╔╝ ╚██████╔╝███████╗╚████╔╝ ███████╗    ██╗',
			\ '╚══════╝  ╚═══╝   ╚═════╝ ╚══════╝ ╚═══╝  ╚══════╝    ╚═╝',
			\ '',
			\ '                       [KyleJKC]',
			\ '',
			\ ]
let g:dashboard_default_executive ='fzf'
" let g:dashboard_custom_shortcut={
"       \ 'last_session'       : 'Ctrl X',
"       \ 'find_history'       : 'Ctrl H',
"       \ 'find_file'          : 'Ctrl P',
"       \ 'new_file'           : 'Ctrl E',
"       \ 'change_colorscheme' : 'Ctrl T',
"       \ 'find_word'          : 'Ctrl F',
"       \ 'book_marks'         : 'Ctrl M',
"       \ }
let g:dashboard_custom_shortcut={
			\ 'last_session'       : 'SPC s l',
			\ 'find_history'       : 'SPC f h',
			\ 'find_file'          : 'SPC f f',
			\ 'new_file'           : 'SPC f n',
			\ 'change_colorscheme' : 'SPC t c',
			\ 'find_word'          : 'SPC f a',
			\ 'book_marks'         : 'SPC f b',
			\ }
noremap <LEADER>fn :DashboardNewFile<CR>
"spaceline设置
let g:spaceline_seperate_style= 'slant-cons'
let g:spaceline_git_branch_icon= ' '
