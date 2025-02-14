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

abbr -a -g nlsg "npm list -g --depth=0"

function multicd
    echo cd (string repeat -n (math (string length -- $argv[1]) - 1) ../)
end

abbr --add dotdot --regex '^\.\.+$' --function multicd

function last_history_item; echo $history[1]; end
abbr -a !! --position anywhere --function last_history_item
