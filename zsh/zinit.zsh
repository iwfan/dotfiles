ZINIT_HOME="${ZINIT_HOME:-$ZPLG_HOME}"
if [ -z "$ZINIT_HOME" ]; then
    ZINIT_HOME="${ZDOTDIR:-$HOME}/.zinit"
fi

ZINIT_BIN_DIR_NAME="${ZINIT_BIN_DIR_NAME:-$ZPLG_BIN_DIR_NAME}"
if [ -z "$ZINIT_BIN_DIR_NAME" ]; then
    ZINIT_BIN_DIR_NAME="bin"
fi

### Added by Zinit's installer
if [[ ! -f $ZINIT_HOME/$ZINIT_BIN_DIR_NAME/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$ZINIT_HOME" && command chmod g-rwX "$ZINIT_HOME"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME/$ZINIT_BIN_DIR_NAME" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$ZINIT_HOME/$ZINIT_BIN_DIR_NAME/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#+-----------------------+
#+ Oh-my-zsh Plugins     +
#+-----------------------+
zinit snippet OMZ::lib/correction.zsh
zinit snippet OMZ::lib/directories.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh

zinit wait lucid light-mode for \
  OMZP::asdf \
  OMZP::git \
  OMZP::colored-man-pages

#+-----------------------+
#+ Other Zsh Plugins     +
#+-----------------------+

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting

zinit wait lucid light-mode \
  blockf atpull'zinit creinstall -q .' \
  for zsh-users/zsh-completions

zinit wait lucid light-mode \
  atinit"ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=244'" \
  atinit"ZSH_AUTOSUGGEST_USE_ASYNC='true'" \
  atload"bindkey '^[\f' autosuggest-accept" \
  atload"_zsh_autosuggest_start" \
  for zsh-users/zsh-autosuggestions

zinit wait lucid light-mode for \
  hlissner/zsh-autopair

# Can't use `wait` mode, else hooks get not registered for the first prompt.
zinit lucid light-mode \
  atinit"zstyle ':completion:*' extra-verbose yes" \
  atinit"zstyle ':completion:*' remote-access no" \
  atinit"zstyle ':autocomplete:*' default-context ''" \
  atinit"zstyle ':autocomplete:*' widget-style menu-select" \
  atinit"zstyle ':autocomplete:*' fzf-completion yes" \
  atinit"zstyle ':autocomplete:*' min-delay 0.05" \
  atinit"zstyle ':autocomplete:*' min-input 0" \
  atinit"zstyle ':autocomplete:*' ignored-input ''" \
  for marlonrichert/zsh-autocomplete
