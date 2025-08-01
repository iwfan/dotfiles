set -gx GPG_TTY tty
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Homebrew's no auto update
set -gx HOMEBREW_NO_AUTO_UPDATE true

# pnpm
set -gx PNPM_HOME "/Users/f/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

# Go
set -gx GOPATH $HOME/go
set -gx GO111MODULE on
set -gx GOPROXY "https://goproxy.cn"
fish_add_path $GOPATH/bin

# Guile Scheme
set -gx GUILE_AUTO_COMPILE 0

# Bat
set -gx BAT_PAGER "less -RF"
set -gx BAT_STYLE "changes,numbers"
set -gx BAT_THEME "ansi"

# RG
set -gx RG_OPTIONS "--smart-case --follow"

# Fd
set -gx FD_OPTIONS "--hidden --follow --exclude .git --exclude node_modules"

# Fzf
set -gx FZF_DEFAULT_COMMAND "fd -t f $FD_OPTIONS"
set -gx FZF_BASE_OPTS "\
  --ansi \
  --multi \
  --height ~40% \
  --layout reverse \
  --info inline \
  --border none \
  --no-scrollbar \
  --tabstop 4 \
  --prompt 'File❯ ' \
  --bind 'ctrl-r:change-prompt(❯ )+reload(fd $FD_OPTIONS)' \
  --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
  --preview='' --preview-window=''"

set -gx FZF_DEFAULT_OPTS "$FZF_BASE_OPTS \
  --bind 'ctrl-d:change-prompt(Dir❯ )+reload(fd -t d $FD_OPTIONS)' \
  --bind 'ctrl-f:change-prompt(File❯ )+reload(fd -t f $FD_OPTIONS)' \
  --bind 'ctrl-/:toggle-preview' \
  --preview='string match -q \"*binary\" (file --mime {} ); and echo {} is a binary file; or bat --color=always --style=numbers --line-range=:100 {}' \
  --preview-window='right:60%:wrap'"


set -gx OBJC_DISABLE_INITIALIZE_FORK_SAFETY YES
