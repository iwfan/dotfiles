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

# Rebase master onto current branch
gmrebase() {
    echo "==> Checking out master..."
    git checkout master
    echo ""
    echo "==> Updating master..."
    git pull
    echo ""
    echo "==> Checking back to original branch"
    git checkout -
    echo ""
    echo "==> Rebasing master onto $(git rev-parse --abbrev-ref HEAD)"
    git rebase master $(git rev-parse --abbrev-ref HEAD)
    echo ""
}

gnrebase() {
    echo "==> Checking out main..."
    git checkout main
    echo ""
    echo "==> Updating main..."
    git pull
    echo ""
    echo "==> Checking back to original branch"
    git checkout -
    echo ""
    echo "==> Rebasing main onto $(git rev-parse --abbrev-ref HEAD)"
    git rebase main $(git rev-parse --abbrev-ref HEAD)
    echo ""
}

fe() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-vim} "${files[@]}"
}

# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
fo() {
  local out file key
  IFS=$'\n' out=("$(fzf-tmux --query="$1" --exit-0 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# find-in-file - usage: fif <searchTerm>
fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  rg --files-with-matches --no-messages "$1" | fzf --preview "highlight -O ansi -l {} 2> /dev/null | rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}"
}
