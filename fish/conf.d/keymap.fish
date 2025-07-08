function fish_hybrid_key_bindings --description \
"Vi-style bindings that inherit emacs-style bindings in all modes"
    for mode in default insert visual
        fish_default_key_bindings -M $mode
    end
    fish_vi_key_bindings --no-erase
end
set -g fish_key_bindings fish_hybrid_key_bindings
# Emulates vim's cursor shape behavior
# Set the normal and visual mode cursors to a block
set -g fish_cursor_default block blink
# Set the insert mode cursor to a line
set -g fish_cursor_insert line blink
# Set the replace mode cursor to an underscore
set -g fish_cursor_replace_one underscore blink
# The following variable can be used to configure cursor shape in
# visual mode, but due to fish_cursor_default, is redundant here
set -g fish_cursor_visual block

bind \cg 'lazygit'
#bind \cv 'nvim'
bind \ct 'y'
bind \cz 'fancy_ctrl_z'

bind -M insert \cg 'lazygit'
#bind -M insert \cv 'nvim'
bind -M insert \ct 'y'
bind -M insert \cz 'fancy_ctrl_z'
