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

alias ls="exa --long --git --modified --color-scale --icons --group-directories-first --time-style=iso"
alias la="ls -a"
alias lt="exa -a --icons --color-scale --tree -L 2 "
alias cp='cp -iv'
alias mv='mv -iv'
alias rm="trash -v"

alias n="pnpm"
alias i="pnpm install --prefer-offline"
alias nlsg="npm list -g --depth=0"
alias y="yarn"
alias yb="yarn run build"
alias ys="yarn run start"
alias yd="yarn run dev"
alias yt="yarn run test"

alias sskq="bundle exec sidekiq -C config/sidekiq.yml"
alias rs="GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:1215' bundle exec rails s"
