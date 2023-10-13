#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

# Homebrew's sbin
export HOMEBREW_NO_AUTO_UPDATE=true
path=(
  $HOME/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

fpath=(
  # Add curl completions from homebrew.
  /{usr/local,opt/homebrew}/opt/curl/share/zsh/site-functions(-/FN)

  # Add zsh completions.
  /{usr/local,opt/homebrew}/share/zsh/site-functions(-/FN)

  # rest of fpath
  $fpath
)

# Added by Toolbox App
path+=($HOME/Library/Application\ Support/JetBrains/Toolbox/scripts)

# Pnpm
export PNPM_HOME="$HOME/Library/pnpm"

# Ruby
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES

# Guile Scheme
export GUILE_AUTO_COMPILE=0

# Bat
export BAT_PAGER="less -RF"
export BAT_STYLE="changes,numbers"
export BAT_THEME="ansi"

# RG
export RG_OPTIONS="--smart-case --follow"

# Fd
export FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"

# Fzf
export DISABLE_FZF_KEY_BINDINGS=true
export FZF_DEFAULT_COMMAND="fd -t f $FD_OPTIONS"
export FZF_BASE_OPTS="\
  --ansi \
  --multi \
  --height ~40% \
  --layout reverse \
  --info inline \
  --border none \
  --no-scrollbar \
  --tabstop 4 \
  --prompt 'File❯ ' \
  --bind 'ctrl-r:change-prompt(❯ )+reload(fd $FD_OPTIONS)' \
  --bind 'ctrl-o:execute(cd {})' \
  --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
  --preview='' --preview-window=''"

export FZF_DEFAULT_OPTS="$FZF_BASE_OPTS \
  --bind 'ctrl-d:change-prompt(Dirs❯ )+reload(fd -t d $FD_OPTIONS)' \
  --bind 'ctrl-f:change-prompt(Files❯ )+reload(fd -t f $FD_OPTIONS)' \
  --bind 'ctrl-/:toggle-preview' \
  --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file \
  || (bat --color=always --style=numbers --line-range=:500 {} || cat {}) 2> /dev/null | head -300' \
  --preview-window='right:60%:wrap'"

export FZF_CTRL_R_OPTS="$FZF_BASE_OPTS"
# Paste the selected files and directories onto the command-line
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_BASE_OPTS"
# cd into the selected directory
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_ALT_C_OPTS="$FZF_BASE_OPTS"

export FZF_COMPLETION_TRIGGER='\'
export FZF_COMPLETION_OPTS='--border --info=inline'

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
