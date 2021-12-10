attach_tmux() {
  tmux attach -t f || tmux new -s f
}

enable_proxy() {
    export https_proxy=http://127.0.0.1:7890
    export http_proxy=http://127.0.0.1:7890
    export all_proxy=socks5://127.0.0.1:7890
}

disable_proxy() {
    unset https_proxy
    unset http_proxy
    unset all_proxy
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=("$(fzf --query="$1" -0 -1 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  file=$(rg --files-with-matches --no-messages "$1" | fzf --preview "rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}")
  ${EDITOR:-vim} "$file"
}

j() {
  if [[ -z "$*" ]]; then
    cd "$(zshz -l 2>&1 | fzf +s | sed 's/^[0-9,.]* *//')"
  else
    _last_z_args="$@"
    zshz "$@"
  fi
}

jj() {
  cd "$(zshz -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q $_last_z_args)"
}

ip () {
  ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
}

port() {
  lsof -nP -iTCP -sTCP:LISTEN | grep $1
}

pid() {
  ps -Ao user,pid,command | grep -v grep | grep $1
}
