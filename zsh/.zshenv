# https://zsh.sourceforge.io/Intro/intro_3.html

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DOTFILES="$HOME/dotfiles"
export ZINIT_HOME="${ZDOTDIR:-$HOME}/.zinit"
export ZINIT_BIN_DIR_NAME="bin"

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TERM=screen-256color
export GPG_TTY=tty

# History Control
export HISTCONTROL=ignorespace

# Editor
export VISUAL=nvim
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export REACT_EDITOR="nvim"

#Homebrew's sbin
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=true

# ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Go
export GOPATH=$HOME/go
export GO111MODULE="on"
export PATH="$GOPATH/bin:$PATH"
export GOPROXY=https://goproxy.cn

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Bat
export BAT_PAGER="less -R"
export BAT_STYLE="changes,numbers"
export BAT_THEME="gruvbox-dark"

# Fd
export FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"

# Fzf
export FZF_DEFAULT_OPTS="--height 80% --reverse --info=inline --color \"border:#b877db\"\
  --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file \
  || (bat --color=always --style=numbers --line-range=:500 {} || cat {}) 2> /dev/null | head -300' \
  --preview-window='right:60%:wrap' \
  --bind='ctrl-d:half-page-down,ctrl-u:half-page-up'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard 2>/dev/null || fd --type f --type l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"

# nnn
BLK="0B" CHR="0B" DIR="04" EXE="06" REG="00" HARDLINK="06" SYMLINK="06" MISSING="00" ORPHAN="09" FIFO="06" SOCK="0B" OTHER="06"
export NNN_FCOLORS="$BLK$CHR$DIR$EXE$REG$HARDLINK$SYMLINK$MISSING$ORPHAN$FIFO$SOCK$OTHER"
export NNN_BMS="d:$HOME/dotfiles;c:$HOME/code/"
export NNN_PLUG="p:preview-tui;"
export NNN_FIFO=/tmp/nnn.fifo
