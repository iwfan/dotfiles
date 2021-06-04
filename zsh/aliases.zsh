alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

alias j="z"
alias v="nvim +SessionLoad"
# Long listing like "ls -la"
alias l='exa -la --group-directories-first --time-style long-iso --color-scale'
# Tree-like listing with 2-level depth
alias lt="l -T -L 2"
alias ls="exa"
alias la="l"
alias rm="trash -v"

alias n="pnpm"
alias ni="pnpm i"
alias ns="pnpm run start"
alias nd="pnpm run dev"
alias nt="pnpm run test"

alias y="yarn"
alias ys="yarn run start"
alias yd="yarn run dev"
alias yt="yarn run test"

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
