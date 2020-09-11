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
source $HOME/dotfiles/nvim/plugins/settings/lightline.vim
source $HOME/dotfiles/nvim/plugins/settings/incsearch.vim
source $HOME/dotfiles/nvim/plugins/settings/coc.vim
source $HOME/dotfiles/nvim/plugins/settings/coc-list.vim
source $HOME/dotfiles/nvim/plugins/settings/indentline.vim
source $HOME/dotfiles/nvim/plugins/settings/nerdcommenter.vim
source $HOME/dotfiles/nvim/plugins/settings/tabular.vim
source $HOME/dotfiles/nvim/plugins/settings/vista.vim

source $HOME/dotfiles/nvim/advanced/code_run.vim
source $HOME/dotfiles/nvim/advanced/keymappings.vim
source $HOME/dotfiles/nvim/plugins/settings/which-key.vim

if empty(glob('$HOME/.config/nvim/_machine_specific.vim'))
  silent! exec "!cp $HOME/dotfiles/nvim/other/machine_special_config.vim $HOME/.config/nvim/_machine_specific.vim"
endif
source $HOME/.config/nvim/_machine_specific.vim

"colorscheme gruvbox
colorscheme onedark
"colorscheme deus
set background=dark
highlight clear SignColumn              " gutter is the same color as where your line numbers show up

" 1. ✅ lsp 支持
" 2. ✅ 文件树管理
" 3. ✅ 全局搜索
" 4. tags 管理
" 5. ✅ terminal 集成
" 6. ✅ 剪贴板管理
