"
"███╗   ███╗██╗   ██╗██╗   ██╗██╗███╗   ███╗██████╗  ██████╗
"████╗ ████║╚██╗ ██╔╝██║   ██║██║████╗ ████║██╔══██╗██╔════╝
"██╔████╔██║ ╚████╔╝ ██║   ██║██║██╔████╔██║██████╔╝██║
"██║╚██╔╝██║  ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║██╔══██╗██║
"██║ ╚═╝ ██║   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║██║  ██║╚██████╗
"╚═╝     ╚═╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝ ╚═════╝
"
source $HOME/dotfiles/nvim/basic/general.vim
source $HOME/dotfiles/nvim/basic/keymappings.vim
source $HOME/dotfiles/nvim/basic/functions.vim

source $HOME/dotfiles/nvim/plugins/plug_list.vim
for f in split(glob('$HOME/dotfiles/nvim/plugins/settings/*.vim'), '\n')
  exe 'source' f
endfor

source $HOME/dotfiles/nvim/advanced/code_run.vim
source $HOME/dotfiles/nvim/advanced/keymappings.vim
source $HOME/dotfiles/nvim/advanced/markdown-keymapping.vim
source $HOME/dotfiles/nvim/plugins/settings/which-key.vim

if empty(glob('$HOME/.config/nvim/_machine_specific.vim'))
  silent! exec "!cp $HOME/dotfiles/nvim/other/machine_special_config.vim $HOME/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim

" colorscheme deus
" highlight clear SignColumn              " gutter is the same color as where your line numbers show up

let g:oceanic_material_allow_bold      = 1
let g:oceanic_material_allow_italic    = 1
let g:oceanic_material_allow_underline = 1
let g:oceanic_material_allow_undercurl = 1
let g:oceanic_material_allow_reverse   = 1

colorscheme oceanic_material
hi VertSplit cterm=reverse ctermfg=235 ctermbg=239 gui=reverse guifg=#282C34 guibg=#504945
hi Visual cterm=reverse ctermfg=111 ctermbg=235 gui=reverse guifg=#a7c777 guibg=#282C34


" 1. ✅ lsp 支持
" 2. ✅ 文件树管理
" 3. ✅ 全局搜索
" 4. tags 管理
" 5. ✅ terminal 集成
" 6. ✅ 剪贴板管理
