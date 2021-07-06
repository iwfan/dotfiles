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

alias y="yarn"
alias yb="yarn run build"
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

# iTerm2
alias imgcat=${HOME}/.iterm2/imgcat
alias imgls=${HOME}/.iterm2/imgls
alias it2api=${HOME}/.iterm2/it2api
alias it2attention=${HOME}/.iterm2/it2attention
alias it2check=${HOME}/.iterm2/it2check
alias it2copy=${HOME}/.iterm2/it2copy
alias it2dl=${HOME}/.iterm2/it2dl
alias it2getvar=${HOME}/.iterm2/it2getvar
alias it2git=${HOME}/.iterm2/it2git
alias it2setcolor=${HOME}/.iterm2/it2setcolor
alias it2setkeylabel=${HOME}/.iterm2/it2setkeylabel
alias it2ul=${HOME}/.iterm2/it2ul
alias it2universion=${HOME}/.iterm2/it2universion

alias sskq="bundle exec sidekiq -C config/sidekiq.yml"
alias rs="GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:1215' bundle exec rails s"
