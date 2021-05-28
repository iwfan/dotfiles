alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

alias vi="/usr/local/bin/nvim"
alias nv="/usr/local/bin/nvim"
alias v="/usr/local/bin/nvim +SessionLoad"
alias e="/usr/local/bin/nvim"
alias ls="lsd"
alias ll="ls -l"
alias la="ls -la"
alias lt="ls --tree"
alias n="pnpm"

################[ todo: todo items (https://github.com/todotxt/todo.txt-cli) ]################
alias tdo="todo.sh"
alias tdl="todo.sh ls"
alias tdla="todo.sh lsa"
alias tda="todo.sh addm"
alias tdc="todo.sh done"
alias tdd="todo.sh del"

##############[ taskwarrior: taskwarrior task count (https://taskwarrior.org/) ]##############
alias t="task"
alias tl="task list"
alias tc="task done"
alias ta="task add"
alias td="task del"

at() {
  tmux attach -t f || tmux new -s f
}

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

# Oops savers
alias gundo='git reset HEAD~'

# Rebase master onto current branch
gmrebase() {
    echo "==> Checking out master..."
    git checkout master
    echo ""
    echo "==> Updating master..."
    git pull
    echo ""
    echo "==> Checking back to original branch"
    git checkout -
    echo ""
    echo "==> Rebasing master onto $(git rev-parse --abbrev-ref HEAD)"
    git rebase master $(git rev-parse --abbrev-ref HEAD)
    echo ""
}

gnrebase() {
    echo "==> Checking out main..."
    git checkout main
    echo ""
    echo "==> Updating main..."
    git pull
    echo ""
    echo "==> Checking back to original branch"
    git checkout -
    echo ""
    echo "==> Rebasing main onto $(git rev-parse --abbrev-ref HEAD)"
    git rebase main $(git rev-parse --abbrev-ref HEAD)
    echo ""
}

# npm install global package
nigp() {
  npm i -g \
    pnpm \
    npkill \
    live-server \
    tldr
}

alias nlsg="npm list -g --depth=0"
