alias ...="../.."
alias ....="../../.."
alias .....="../../../.."
alias -- -="cd -"
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"
alias dot="$HOME/dotfiles"

alias c='pbcopy'
alias d='dirs -v'

alias v="nvim"
alias vi="nvim"

alias ls="exa --long --header --git --modified --color-scale"
alias la="exa -la --long --header --git --modified --color-scale"
alias lt="tree -L 2"
alias cp='cp -iv'
alias mv='mv -iv'
alias rm="trash -v"

alias ip="ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'"
# https://stackoverflow.com/a/15503178/1820217
alias gitlog="git ls-files -z | xargs -0n1 git blame -w --show-email | perl -n -e '/^.*?\((.*?)\s+[\d]{4}/; print $1,"\n"' | sort -f | uniq -c | sort -n"

alias n="pnpm"
alias nlsg="npm list -g --depth=0"
alias y="yarn"
alias yb="yarn run build"
alias ys="yarn run start"
alias yd="yarn run dev"
alias yt="yarn run test"

alias sskq="bundle exec sidekiq -C config/sidekiq.yml"
alias rs="GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:1215' bundle exec rails s"
