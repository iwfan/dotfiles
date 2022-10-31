alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"

alias v="nvim"
alias vi="nvim"

alias ls="exa"
alias ll="exa --long --classify --links --header --git --sort=date --group-directories-first --time-style=long-iso"
alias la="ll --all"
alias lt="exa --tree --level=2"

alias cat='bat --paging=never'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm="trash -v"

alias n="pnpm"
alias ns="npm run start"
alias i="pnpm install --prefer-offline"
alias nlsg="npm list -g --depth=0"

alias sskq="bundle exec sidekiq -C config/sidekiq.yml"
alias rs="GD_FE=local GD_FE_VITE=on GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:1215, localhost:4200' bundle exec rails s -u webrick"
