source ~/dotfiles/zsh/.zaliases
source ~/dotfiles/zsh/.zbindings
source ~/dotfiles/zsh/.zfunctions
source ~/dotfiles/zsh/.zoptions
source ~/dotfiles/zsh/.zstyles

# The plugin will auto execute this zvm_after_init function
function zvm_after_init() {
  autoload -U edit-command-line
  zle -N edit-command-line
  bindkey '\C-x\C-e' edit-command-line
  if [[ $(uname) == "Darwin" ]]; then
    source "$(brew --prefix fzf)/shell/key-bindings.zsh"
  fi
}

typeset -ga ZSH_AUTOSUGGEST_STRATEGY=(completion)

if [[ $(uname) == "Darwin" ]]; then
   source $(brew --prefix antidote)/share/antidote/antidote.zsh
else
   source ${ZDOTDIR:-$HOME}/.antidote/antidote.zsh
fi
antidote load

autoload -Uz promptinit && promptinit && prompt pure

eval "$(zoxide init zsh --cmd j)"
eval "$(mise activate zsh)"
