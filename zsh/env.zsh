export PATH="/usr/local/sbin:$PATH"
export PATH="/usr/local/opt/python@3.8/bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"
[ -s "/usr/local/opt/nvm/etc/bash_completion" ] && . "/usr/local/opt/nvm/etc/bash_completion"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

export GPG_TTY=$(tty)
export TERM=xterm-256color
export TERM_ITALICS=true
export RANGER_LOAD_DEFAULT_RC="false"
#export TERM=screen-256color
export EDITOR=nvim
export ZSH_AUTOSUGGEST_USE_ASYNC=1
export ZSH_AUTOSUGGEST_MANUAL_REBIND=1