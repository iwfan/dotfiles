let g:vista#renderer#enable_icon          = 1
let g:vista_disable_statusline            = 1
let g:vista_icon_indent                   = ["╰─▸ ", "├─▸ "]
let g:vista_default_executive             = 'coc'
let g:vista_finder_alternative_executives = [ 'ctags' ]
let g:vista_echo_cursor_strategy          = 'floating_win'
let g:vista_vimwiki_executive             = 'markdown'
let g:vista_executive_for                 = {
  \ 'vimwiki': 'markdown',
  \ 'pandoc': 'markdown',
  \ 'markdown': 'toc',
  \ 'yaml': 'coc',
  \ 'typescript': 'coc',
  \ 'typescriptreact': 'coc',
  \ }
let g:vista_fzf_preview                   = ['right:50%']
let g:vista_cursor_delay                  = 200
let g:vista_update_on_text_changed        = 1