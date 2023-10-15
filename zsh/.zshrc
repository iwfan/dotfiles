# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

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
  source "$(brew --prefix fzf)/shell/key-bindings.zsh"
}

typeset -ga ZSH_AUTOSUGGEST_STRATEGY=(completion)

source $(brew --prefix antidote)/share/antidote/antidote.zsh
antidote load

autoload -Uz promptinit && promptinit && prompt powerlevel10k

eval "$(zoxide init zsh --cmd j)"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
