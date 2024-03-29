alias ls "eza"
alias la "eza -a"
alias ll "eza -al"
alias lt "eza -a --tree -L 2 --long --icons --git-ignore"

alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm "trash -v"
alias cat "bat --paging=never"
alias v "nvim"
alias lg "lazygit"
alias lf "lfcd"
alias ssh "TERM=xterm-256color kitten ssh"

abbr -a -g nlsg "npm list -g --depth=0"
abbr -a -g sskq "bundle exec sidekiq -C config/sidekiq.yml"
abbr -a -g rs "GD_FE=local GD_FE_VITE=true GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:3002, localhost:3003, localhost:3004, localhost:3009, localhost:1215, localhost:4200' bundle exec rails s"

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item
