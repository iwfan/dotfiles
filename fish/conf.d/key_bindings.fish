set -g fish_key_bindings fish_vi_key_bindings

set -g fish_cursor_default     block      blink
set -g fish_cursor_insert      line       blink
set -g fish_cursor_replace_one underscore blink
set -g fish_cursor_visual      block

bind -M insert \cc kill-whole-line repaint
bind -M normal L end-of-line

bind -M insert \cg 'lazygit; commandline -f repaint'

bind \cg 'lazygit; commandline -f repaint'
