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


function zle_eval {
    echo -en "\e[2K\r"
    eval "$@"
    zle redisplay
}

function openlazygit {
    zle_eval lazygit
}

zle -N openlazygit;
bindkey "^G" openlazygit

function openlazynpm {
    zle_eval lazynpm
}

zle -N openlazynpm;
bindkey "^N" openlazynpm