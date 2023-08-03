# https://zsh.sourceforge.io/Intro/intro_3.html
# https://stackoverflow.com/a/21163441

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export ZINIT_HOME="${ZDOTDIR:-$HOME}/.zinit"
export ZINIT_BIN_DIR_NAME="bin"

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export GPG_TTY=tty
export VISUAL=nvim
export EDITOR=nvim
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

#Homebrew's sbin
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=true
eval "$(/opt/homebrew/bin/brew shellenv)"

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"

# ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Guile Scheme
export GUILE_AUTO_COMPILE=0

# Go
export GOPATH=$HOME/go
export GO111MODULE="on"
export PATH="$GOPATH/bin:$PATH"
export GOPROXY=https://goproxy.cn

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Bat
export BAT_PAGER="less -RF"
export BAT_STYLE="changes,numbers"
export BAT_THEME="ansi"

# RG
export RG_OPTIONS="--smart-case --follow"

# Fd
export FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"

# Fzf
export DISABLE_FZF_KEY_BINDINGS=true
export FZF_DEFAULT_COMMAND="fd -t f $FD_OPTIONS"
export FZF_BASE_OPTS="-m --ansi --height 40% --reverse --info inline --tabstop=4 \
  --prompt 'File❯ ' \
  --bind 'ctrl-r:change-prompt(❯ )+reload(fd $FD_OPTIONS)' \
  --bind 'ctrl-o:execute(cd {})' \
  --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
  --preview='' --preview-window=''"

export FZF_DEFAULT_OPTS="$FZF_BASE_OPTS \
  --bind 'ctrl-d:change-prompt(Dirs❯ )+reload(fd -t d $FD_OPTIONS)' \
  --bind 'ctrl-f:change-prompt(Files❯ )+reload(fd -t f $FD_OPTIONS)' \
  --bind 'ctrl-/:toggle-preview' \
  --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file \
  || (bat --color=always --style=numbers --line-range=:500 {} || cat {}) 2> /dev/null | head -300' \
  --preview-window='right:60%:wrap'"

export FZF_CTRL_R_OPTS="$FZF_BASE_OPTS"
# Paste the selected files and directories onto the command-line
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_BASE_OPTS"
# cd into the selected directory
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_ALT_C_OPTS="$FZF_BASE_OPTS"

export FZF_COMPLETION_TRIGGER='\'
export FZF_COMPLETION_OPTS='--border --info=inline'
