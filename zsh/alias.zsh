alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"

alias ls="exa -F"
alias la="exa -F -a"
alias ll="exa -F -al"
alias lt="exa -a --tree -L 2 --long --icons --git-ignore"
alias cat='bat --paging=never'
alias cp='cp -iv'
alias mv='mv -iv'
alias rm="trash -v"
alias ssh="kitty +kitten ssh"

alias nlsg="npm list -g --depth=0"
alias sskq="bundle exec sidekiq -C config/sidekiq.yml"
alias rs="GD_FE=local GD_FE_VITE=true GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:3002, localhost:1215, localhost:4200' bundle exec rails s"
