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
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh

zinit ice wait lucid
zinit snippet OMZ::lib/completion.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit ice wait lucid
zinit snippet OMZ::plugins/asdf/asdf.plugin.zsh

#+-----------------------+
#+ Other Zsh Plugins     +
#+-----------------------+

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 atpull"zinit creinstall -q ." atload"zicompinit; zicdreplay" blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

zinit ice wait lucid
zinit light agkozak/zsh-z

# Load pure theme
zinit ice compile'(pure|async).zsh' pick'async.zsh' src'pure.zsh'
zinit light sindresorhus/pure
