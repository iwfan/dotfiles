# Environment
set -U TERM        screen-256color
set -U LANG        en_US.UTF-8
set -U VISUAL      nvim
set -U EDITOR      nvim
set -U HISTCONTROL ignorespace

set -gx GPG_TTY (tty)
set -gx HOMEBREW_NO_AUTO_UPDATE true
set -gx GOPATH $HOME/go

## KEY_BINDINGS
function fish_user_key_bindings
    bind \co __fzf_open --editor
    bind \cr __fzf_reverse_isearch
    bind \c] __ghq_repository_search
    bind \cb __fzf_select_branch
end

## OPTIONS
function fzf
    command fzf --height 30% --reverse --border $argv
end

starship init fish | source
