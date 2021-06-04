# https://zsh.sourceforge.io/Intro/intro_3.html

export TERM=screen-256color
export LANG=en_US.UTF-8
export GPG_TTY=tty

# History Control
export HISTCONTROL=ignorespace

# Editor
export VISUAL=nvim
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export REACT_EDITOR="nvim"

#Homebrew's sbin
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=true

# Go
export GOPATH=$HOME/go
export GO111MODULE="on"
export PATH="$GOPATH/bin:$PATH"
export GOPROXY=https://goproxy.cn

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Bat
export BAT_THEME="TwoDark"

# Fzf
FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_COMPLETION_TRIGGER='/'
export FZF_DEFAULT_OPTS="--height 90% --reverse --color \"border:#b877db\"\
  --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file \
  || (bat --color=always --style=numbers --line-range=:500 {} || cat {}) 2> /dev/null | head -300' \
  --bind='ctrl-d:half-page-down,ctrl-u:half-page-up'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type -l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZD_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
