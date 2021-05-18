export TERM=screen-256color
export LANG=en_US.UTF-8
export EDITOR=nvim

export GOPATH=$HOME/go
export PATH="/usr/local/sbin:$GOPATH/bin:$PATH"

export FZF_DEFAULT_COMMAND='fd'
export FZF_COMPLETION_TRIGGER='/'
export FZF_DEFAULT_OPTS='--preview "ccat --color=always {}"'
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
