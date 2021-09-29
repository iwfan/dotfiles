alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ~="cd ~"
alias -- -="cd -"

alias j="z"
alias c='pbcopy'
alias v="nvim"
alias vi="nvim"
alias ip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
alias ls="exa --long --header --git --modified --color-scale"
alias la="exa -la --long --header --git --modified --color-scale"
alias lt="tree -L 2"
alias rm="trash -v"

alias n="pnpm"
alias nlsg="npm list -g --depth=0"
alias y="yarn"
alias yb="yarn run build"
alias ys="yarn run start"
alias yd="yarn run dev"
alias yt="yarn run test"

##############[ taskwarrior: taskwarrior task count (https://taskwarrior.org/) ]##############
alias t="task"
alias tl="task list"
alias tc="task done"
alias ta="task add"
alias td="task del"

# i -TTerl2
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
