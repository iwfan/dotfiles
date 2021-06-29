# https://zsh.sourceforge.io/Intro/intro_3.html

# Locale
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

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
export PATH="/usr/local/sbin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=true

# Local Nvim
export PATH="$HOME/Downloads/nvim-osx64/bin/:$PATH"

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
export BAT_THEME="TwoDark"

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
