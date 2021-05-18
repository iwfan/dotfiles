export TERM=screen-256color
export LANG=en_US.UTF-8
export EDITOR=nvim

export GOPATH=$HOME/go
export PATH="/usr/local/sbin:$GOPATH/bin:$PATH"

FD_OPTIONS="--follow --exclude .git --exclude node_modules"
export FZF_DEFAULT_OPTS="--height 50% --reverse --multi \
  --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file \
  || (ccat --color=always {} || cat {}) 2> /dev/null | head -300' \
  --bind='ctrl-d:half-page-down,ctrl-u:half-page-up'"
export FZF_DEFAULT_COMMAND="git ls-files --cached --others --exclude-standard | fd --type f --type -l $FD_OPTIONS"
export FZF_CTRL_T_COMMAND="fd $FD_OPTIONS"
export FZD_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_COMPLETION_TRIGGER='/'
export FZF_TMUX=1
export FZF_TMUX_HEIGHT='80%'

export HOMEBREW_NO_AUTO_UPDATE=true

enable_proxy() {
    export https_proxy=http://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
    export all_proxy=socks5://127.0.0.1:7890
}

disable_proxy() {
    export https_proxy=
    export http_proxy=
    export all_proxy=
}

disable_proxy
