# ============================================================================
# Modern Zsh Configuration
# ============================================================================

# ----------------------------------------------------------------------------
# Performance Profiling (uncomment to debug slow startup)
# ----------------------------------------------------------------------------
# zmodload zsh/zprof

# ----------------------------------------------------------------------------
# Path Configuration
# ----------------------------------------------------------------------------
export PATH="$HOME/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"

# ----------------------------------------------------------------------------
# History Configuration
# ----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY          # Write timestamp to history
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first
setopt HIST_IGNORE_DUPS          # Don't record duplicate entries
setopt HIST_IGNORE_ALL_DUPS      # Delete old duplicate entries
setopt HIST_FIND_NO_DUPS         # Don't display duplicates when searching
setopt HIST_IGNORE_SPACE         # Don't record entries starting with space
setopt HIST_SAVE_NO_DUPS         # Don't write duplicates to history file
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks
setopt SHARE_HISTORY             # Share history between sessions

# ----------------------------------------------------------------------------
# Directory Navigation
# ----------------------------------------------------------------------------
setopt AUTO_CD                   # cd by typing directory name
setopt AUTO_PUSHD                # Push directories onto stack
setopt PUSHD_IGNORE_DUPS         # Don't push duplicates
setopt PUSHD_MINUS               # Reverse +/- operators

# ----------------------------------------------------------------------------
# Completion System
# ----------------------------------------------------------------------------
autoload -Uz compinit

# Speed up compinit by checking cache once per day
if [[ -n ${ZDOTDIR}/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # Case insensitive
zstyle ':completion:*' menu select                         # Menu selection
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # Colored completion
zstyle ':completion:*' group-name ''                       # Group results
zstyle ':completion:*:descriptions' format '%B%d%b'        # Format descriptions
zstyle ':completion:*:warnings' format 'No matches found'  # No match message
zstyle ':completion:*' rehash true                         # Automatically find new executables

# ----------------------------------------------------------------------------
# Key Bindings
# ----------------------------------------------------------------------------
bindkey -e  # Emacs key bindings (use -v for vi mode)

# Better history search
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

bindkey '^[[A' up-line-or-beginning-search     # Up arrow
bindkey '^[[B' down-line-or-beginning-search   # Down arrow
bindkey '^P' up-line-or-beginning-search       # Ctrl+P
bindkey '^N' down-line-or-beginning-search     # Ctrl+N

autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line  # Ctrl+X Ctrl+E

# Other useful bindings
bindkey '^[[H' beginning-of-line               # Home
bindkey '^[[F' end-of-line                     # End
bindkey '^[[3~' delete-char                    # Delete
bindkey '^[[1;5C' forward-word                 # Ctrl+Right
bindkey '^[[1;5D' backward-word                # Ctrl+Left

# Custom widget for lazygit
lazygit-widget() {
  BUFFER=""
  zle clear-screen
  lazygit
  zle reset-prompt
}
zle -N lazygit-widget
bindkey '^g' lazygit-widget                    # Ctrl+G

# Custom widget for yazi
yazi-widget() {
  local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
  yazi "$@" --cwd-file="$tmp"
  if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
    cd -- "$cwd"
  fi
  rm -f -- "$tmp"
  zle reset-prompt
}
zle -N yazi-widget
bindkey '^t' yazi-widget                       # Ctrl+T

# Custom widget for nvim
nvim-widget() {
  BUFFER=""
  zle clear-screen
  nvim
  zle reset-prompt
}
zle -N nvim-widget
bindkey '^o' nvim-widget                       # Ctrl+V

# ----------------------------------------------------------------------------
# Prompt Configuration
# ----------------------------------------------------------------------------
autoload -Uz vcs_info
setopt PROMPT_SUBST

# Configure vcs_info for git
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' formats '%b'
zstyle ':vcs_info:git:*' actionformats '%b|%a'

# Function to get git status symbols
git_prompt_status() {
  local git_status=""
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    # Check for uncommitted changes
    if ! git diff --quiet 2>/dev/null; then
      git_status="+"
    fi
    # Check for untracked files
    if [[ -n $(git ls-files --others --exclude-standard 2>/dev/null) ]]; then
      git_status="${git_status}?"
    fi
  fi
  echo "$git_status"
}


# Precmd function to update vcs_info and build prompt
precmd() {
  vcs_info
  
  # Path
  local path_display="%F{cyan}%~%f"
  
  # Git branch with status
  local git_info=""
  if [[ -n "${vcs_info_msg_0_}" ]]; then
    local git_status="$(git_prompt_status)"
    git_info=" %F{240}on %F{magenta}${vcs_info_msg_0_}%f"
    if [[ -n "$git_status" ]]; then
      git_info="${git_info} %F{red}[${git_status}]%f"
    fi
  fi
  
  # Time for right side
  local time_display="%F{240}%*%f"
  
  # Second line: background jobs indicator + prompt symbol
  local jobs_indicator="%(1j.%F{yellow}[✦]%f .)"
  local prompt_symbol="%(?,%F{cyan}→%f,%F{red}→%f)"
  
  PROMPT="${path_display}${git_info}
${jobs_indicator}${prompt_symbol} "
}

# Clear right prompt
RPROMPT=''

# ----------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------

# Basic commands
alias ls='ls --color=auto'
alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

# Safety nets
alias rm='rm -i'
alias rrm="trash -v"
alias cp='cp -i'
alias mv='mv -i'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias -- -='cd -'

# Git shortcuts
alias g='git'
alias ga='git add'
alias gc='git commit'
alias gco='git checkout'
alias gst='git status'
alias gp='git push'
alias gl='git pull'
alias glr='git pull --rebase'
alias gd='git diff'
alias glog='git log --oneline --graph --decorate'

# System
alias df='df -h'
alias du='du -h'
alias free='free -h'

# Quick edits
alias zshrc='${EDITOR:-nvim} ~/.zshrc'
alias reload='source ~/.zshrc'

# ----------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------

# Create directory and cd into it
mkcd() {
  mkdir -p "$1" && cd "$1"
}

# Extract various archive formats
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *)           echo "'$1' cannot be extracted" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Find files by name
ff() {
  find . -type f -iname "*$1*"
}

# Find directories by name
fd() {
  find . -type d -iname "*$1*"
}

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

ip () {
  ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
}

port() {
  lsof -nP -iTCP -sTCP:LISTEN | grep $1
}

killport() {
 lsof -nP -iTCP -sTCP:LISTEN | grep $argv[1] | awk '{print $2}' | xargs kill
}


# ----------------------------------------------------------------------------
# Environment Variables
# ----------------------------------------------------------------------------
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS='-R'

# Colored man pages
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

# Homebrew's sbin
export HOMEBREW_NO_AUTO_UPDATE=true

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


# ----------------------------------------------------------------------------
# Additional Options
# ----------------------------------------------------------------------------
setopt CORRECT                   # Spell correction for commands
setopt INTERACTIVE_COMMENTS      # Allow comments in interactive shell
setopt NO_BEEP                   # No beeping
setopt MULTIOS                   # Implicit tees/cats with multiple redirections

# ----------------------------------------------------------------------------
# Plugin Manager (Optional - uncomment if using zinit)
# ----------------------------------------------------------------------------
ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
  bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
fi

source "${ZINIT_HOME}/zinit.zsh"

zinit wait lucid for \
 atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
    zdharma-continuum/fast-syntax-highlighting \
 blockf \
    zsh-users/zsh-completions \
 atload"!_zsh_autosuggest_start" \
    zsh-users/zsh-autosuggestions

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init zsh --cmd j)"
eval "$(mise activate zsh)"

# ----------------------------------------------------------------------------
# Local Configuration
# ----------------------------------------------------------------------------
# Load local configuration if it exists
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# ----------------------------------------------------------------------------
# Performance Profiling (uncomment if enabled at top)
# ----------------------------------------------------------------------------
# zprof

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
