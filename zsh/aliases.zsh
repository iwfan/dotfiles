alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

alias reload="source ~/.zshrc"
alias v="nvim +SessionLoad"
alias ls="lsd"
alias ll="ls -l"
alias la="ls -la"
alias lt="ls --tree"
alias rm="trash -v"
alias j="z"

alias n="pnpm"
alias ni="pnpm i"
alias ns="pnpm run start"
alias nd="pnpm run dev"
alias nt="pnpm run test"

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

# Oops savers
alias gundo='git reset HEAD~'

alias nlsg="npm list -g --depth=0"
