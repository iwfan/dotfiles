alias ... "cd ../.."
alias .... "cd ../../.."

alias ls "exa --long --git --modified --color-scale --icons --group-directories-first --time-style=iso"
alias la "ls -a"
alias lt "exa -a --icons --color-scale --tree -L 2 "

alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm "trash -v"

alias vi "nvim"
alias n "pnpm"

abbr -a -g i "pnpm install --prefer-offline"
abbr -a -g nlsg "npm list -g --depth=0"
abbr -a -g y "yarn"
abbr -a -g yb "yarn run build"
abbr -a -g ys "yarn run start"
abbr -a -g yd "yarn run dev"
abbr -a -g yt "yarn run test"

abbr -a -g sskq "bundle exec sidekiq -C config/sidekiq.yml"
abbr -a -g rs "GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:1215' bundle exec rails s"
