alias ... "cd ../.."
alias .... "cd ../../.."

alias ls "exa -F"
alias la "exa -F -a"
alias ll "exa -F -al"
alias lt "exa -a --tree -L 2 --long --icons --git-ignore"

alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm "trash -v"

alias vi "nvim"
alias n "pnpm"

abbr -a -g i "pnpm install --prefer-offline"
abbr -a -g nlsg "npm list -g --depth=0"
abbr -a -g ns "npm run start"

abbr -a -g sskq "bundle exec sidekiq -C config/sidekiq.yml"
abbr -a -g rs "GD_FE=local GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:1215' bundle exec rails s"
