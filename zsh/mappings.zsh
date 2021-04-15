j() {
 if [[ -z "$*" ]]; then
  cd "$(_z -l 2>&1 | fzf +s | sed 's/^[0-9,.]* *//')"
 else
  _last_z_args="$@"
  _z "$@"
 fi
}
jj() {
 cd "$(_z -l 2>&1 | sed 's/^[0-9,.]* *//' | fzf -q $_last_z_args)"
}

bindkey -s '^G' 'lazygit^M'
