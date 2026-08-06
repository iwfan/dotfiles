# ============================================================================
# Modern Zsh Configuration (macOS & Fedora / Linux Compatible)
# ============================================================================

# ----------------------------------------------------------------------------
# Path & Environment Setup (Loaded early for all shells)
# ----------------------------------------------------------------------------
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"

# Homebrew environment (macOS & Linuxbrew on Fedora)
for _brew in /opt/homebrew/bin/brew /usr/local/bin/brew /home/linuxbrew/.linuxbrew/bin/brew; do
  if [[ -x "$_brew" ]]; then
    eval "$("$_brew" shellenv)"
    break
  fi
done
unset _brew

# Environment Variables
export EDITOR='nvim'
export VISUAL='nvim'
export PAGER='less'
export LESS='-R'

# Homebrew & TLDR
export HOMEBREW_NO_AUTO_UPDATE=true
export TLDR_AUTO_UPDATE_DISABLED=true

# Tool Paths (Flutter & Bun)
[[ -d "$HOME/development/flutter/bin" ]] && export PATH="$HOME/development/flutter/bin:$PATH"
export BUN_INSTALL="$HOME/.bun"
[[ -d "$BUN_INSTALL/bin" ]] && export PATH="$BUN_INSTALL/bin:$PATH"

# Bat, Ripgrep, Fd
export BAT_PAGER="less -RF"
export BAT_STYLE="changes,numbers"
export BAT_THEME="ansi"
export RG_OPTIONS="--smart-case --follow"
export FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"

# Fzf Configuration
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
  --bind 'ctrl-y:execute-silent(echo -n {} | (pbcopy 2>/dev/null || wl-copy 2>/dev/null || xclip -selection clipboard 2>/dev/null || xsel --clipboard --input 2>/dev/null))+abort' \
  --preview='' --preview-window=''"

export FZF_DEFAULT_OPTS="$FZF_BASE_OPTS \
  --bind 'ctrl-d:change-prompt(Dirs❯ )+reload(fd -t d $FD_OPTIONS)' \
  --bind 'ctrl-f:change-prompt(Files❯ )+reload(fd -t f $FD_OPTIONS)' \
  --bind 'ctrl-/:toggle-preview' \
  --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file \
  || (bat --color=always --style=numbers --line-range=:500 {} || cat {}) 2> /dev/null | head -300' \
  --preview-window='right:60%:wrap'"

export FZF_CTRL_R_OPTS="$FZF_BASE_OPTS"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="$FZF_BASE_OPTS"
export FZF_ALT_C_COMMAND="fd --type d $FD_OPTIONS"
export FZF_ALT_C_OPTS="$FZF_BASE_OPTS"
export FZF_COMPLETION_TRIGGER='?'
export FZF_COMPLETION_OPTS="$FZF_BASE_OPTS"

# ----------------------------------------------------------------------------
# Tool Integrations (mise, zoxide)
# ----------------------------------------------------------------------------
command -v mise &>/dev/null && eval "$(mise activate zsh)"
command -v zoxide &>/dev/null && eval "$(zoxide init zsh --cmd j)"

# ----------------------------------------------------------------------------
# Shell Options & History
# ----------------------------------------------------------------------------
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000

setopt EXTENDED_HISTORY HIST_EXPIRE_DUPS_FIRST HIST_IGNORE_ALL_DUPS \
       HIST_FIND_NO_DUPS HIST_IGNORE_SPACE HIST_SAVE_NO_DUPS \
       HIST_REDUCE_BLANKS INC_APPEND_HISTORY
unsetopt SHARE_HISTORY

setopt AUTO_CD AUTO_PUSHD PUSHD_IGNORE_DUPS PUSHD_MINUS CORRECT \
       INTERACTIVE_COMMENTS NO_BEEP MULTIOS

# ----------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------
if ls --color=auto /dev/null &>/dev/null; then
  alias ls='ls --color=auto'
else
  alias ls='ls -G'
fi

alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'
alias rm='rm -i'
alias rrm="trash -v"
alias cp='cp -i'
alias mv='mv -i'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

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

if [[ "$OSTYPE" == linux* ]]; then
  alias open='xdg-open'
  if command -v wl-copy &>/dev/null; then
    alias pbcopy='wl-copy'
    alias pbpaste='wl-paste'
  elif command -v xclip &>/dev/null; then
    alias pbcopy='xclip -selection clipboard'
    alias pbpaste='xclip -selection clipboard -o'
  elif command -v xsel &>/dev/null; then
    alias pbcopy='xsel --clipboard --input'
    alias pbpaste='xsel --clipboard --output'
  fi
fi

alias df='df -h'
alias du='du -h'
command -v free &>/dev/null && alias free='free -h'

alias zshrc='${EDITOR:-nvim} ~/.zshrc'
alias reload='source ~/.zshrc'

# ----------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------
mkcd() { mkdir -p "$1" && cd "$1"; }

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

ff() { find . -type f -iname "*$1*"; }
fdd() { find . -type d -iname "*$1*"; }

attach_tmux() { tmux attach -t f 2>/dev/null || tmux new -s f; }

enable_proxy() {
  export https_proxy=http://127.0.0.1:7890
  export http_proxy=http://127.0.0.1:7890
  export all_proxy=socks5://127.0.0.1:7890
}

disable_proxy() {
  unset https_proxy http_proxy all_proxy
}

fo() {
  local out file key
  IFS=$'\n' out=("$(fzf --query="$1" -0 -1 --expect=ctrl-o,ctrl-e)")
  key=$(head -1 <<< "$out")
  file=$(head -2 <<< "$out" | tail -1)
  if [ -n "$file" ]; then
    [ "$key" = ctrl-o ] && open "$file" || ${EDITOR:-vim} "$file"
  fi
}

fif() {
  if [ ! "$#" -gt 0 ]; then echo "Need a string to search for!"; return 1; fi
  file=$(rg --files-with-matches --no-messages "$1" | fzf --preview "rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$1' || rg --ignore-case --pretty --context 10 '$1' {}")
  ${EDITOR:-vim} "$file"
}

myip() {
  if [[ "$OSTYPE" == darwin* ]]; then
    ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p'
  elif command -v hostname &>/dev/null && hostname -I &>/dev/null; then
    hostname -I | awk '{print $1}'
  else
    ip -4 addr show | grep -oP '(?<=inet )([0-9]+\.){3}[0-9]+' | grep -v '^127\.'
  fi
}

port() { lsof -nP -iTCP -sTCP:LISTEN | grep "$1"; }
killport() { lsof -nP -iTCP -sTCP:LISTEN | grep "$1" | awk '{print $2}' | xargs kill; }

# ----------------------------------------------------------------------------
# Hooks
# ----------------------------------------------------------------------------
autoload -Uz add-zsh-hook

function auto_venv() {
  if [[ -n "$VIRTUAL_ENV" && "$PWD" != *"${VIRTUAL_ENV:h}"* ]]; then
    type deactivate &>/dev/null && deactivate
    return
  fi

  [[ -n "$VIRTUAL_ENV" ]] && return

  local dir="$PWD"
  while [[ "$dir" != "/" ]]; do
    if [[ -f "$dir/.venv/bin/activate" ]]; then
      source "$dir/.venv/bin/activate"
      return
    fi
    dir="${dir:h}"
  done
}

add-zsh-hook chpwd auto_venv

function check_git_user_config() {
  if git rev-parse --is-inside-work-tree &>/dev/null; then
    local local_user_name=$(git config --local user.name 2>/dev/null)
    local local_user_email=$(git config --local user.email 2>/dev/null)

    if [[ -z "$local_user_name" ]] || [[ -z "$local_user_email" ]]; then
      echo ""
      echo "⚠️  Warning: This git repository is missing local user configuration!"
      echo ""
      [[ -z "$local_user_name" ]] && echo "   ❌ Local user.name is not set"
      [[ -z "$local_user_email" ]] && echo "   ❌ Local user.email is not set"
      echo ""
      echo "   To fix this, run:"
      echo "   git config user.name \"Your Name\""
      echo "   git config user.email \"your.email@example.com\""
      echo ""
    fi
  fi
}

add-zsh-hook chpwd check_git_user_config

# ----------------------------------------------------------------------------
# Interactive Shell Configuration
# ----------------------------------------------------------------------------
if [[ -o interactive ]]; then

  # Completion System
  if [[ -z "${ZSH_EXECUTION_STRING-}" ]]; then
    zmodload zsh/zle 2>/dev/null
    autoload -Uz compinit
    local zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
    if [[ -f "$zcompdump" && -n "$zcompdump"(#qN.mh+24) ]]; then
      compinit
    elif [[ ! -f "$zcompdump" ]]; then
      compinit
    else
      compinit -C
    fi
  fi

  zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
  zstyle ':completion:*' menu select
  zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
  zstyle ':completion:*' group-name ''
  zstyle ':completion:*:descriptions' format '%B%d%b'
  zstyle ':completion:*:warnings' format 'No matches found'
  zstyle ':completion:*' rehash true

  # Prompt Configuration
  autoload -Uz vcs_info
  setopt PROMPT_SUBST

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:git:*' formats '%F{magenta}%b%f%c%u'
  zstyle ':vcs_info:git:*' actionformats '%F{magenta}%b%F{yellow}|%a%f%c%u'

  _is_ssh() {
    [[ -n "$SSH_CONNECTION" || -n "$SSH_CLIENT" || -n "$SSH_TTY" ]]
  }

  _build_prompt() {
    local context=""
    _is_ssh && context="%F{red}%n@%m%f "

    local path_display="%F{cyan}%~%f"
    local git_info=""
    [[ -n "${vcs_info_msg_0_}" ]] && git_info=" %F{240}on %F{magenta}${vcs_info_msg_0_}%f"

    local proxy_info=""
    [[ -n "$http_proxy" || -n "$https_proxy" || -n "$all_proxy" ]] && proxy_info=" %F{240}using%f %F{yellow}proxy%f"

    local jobs_indicator="%(1j.%F{yellow}[&]%f .)"
    local exit_code="%(?..%F{red}%?%f )"
    local prompt_symbol="%(?,%F{cyan}>%f,%F{red}!%f)"

    RPROMPT='%F{240}%*%f'
    PROMPT="${context}${path_display}${git_info}${proxy_info}
${exit_code}${jobs_indicator}${prompt_symbol} "
  }

  precmd() {
    vcs_info
    _build_prompt
  }

  # ZLE Widgets & Key Bindings
  if [[ -z "${ZSH_EXECUTION_STRING-}" ]]; then
    bindkey -e

    autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
    zle -N up-line-or-beginning-search
    zle -N down-line-or-beginning-search

    for keymap in emacs viins; do
      bindkey -M "$keymap" $'\e[A' up-line-or-history
      bindkey -M "$keymap" $'\eOA' up-line-or-history
      bindkey -M "$keymap" $'\e[B' down-line-or-history
      bindkey -M "$keymap" $'\eOB' down-line-or-history

      [[ -n ${terminfo[kcuu1]} ]] && bindkey -M "$keymap" "${terminfo[kcuu1]}" up-line-or-history
      [[ -n ${terminfo[kcud1]} ]] && bindkey -M "$keymap" "${terminfo[kcud1]}" down-line-or-history
    done

    bindkey '^P' up-line-or-history
    bindkey '^N' down-line-or-history
    bindkey '^[[5~' up-line-or-beginning-search
    bindkey '^[[6~' down-line-or-beginning-search

    autoload -Uz edit-command-line
    zle -N edit-command-line
    bindkey '^X^E' edit-command-line

    bindkey '^[[H' beginning-of-line
    bindkey '^[[F' end-of-line
    bindkey '^[[3~' delete-char
    bindkey '^[[1;5C' forward-word
    bindkey '^[[1;5D' backward-word

    lazygit_widget() {
      BUFFER=""
      zle clear-screen
      lazygit
      _build_prompt
      zle reset-prompt
    }
    zle -N lazygit_widget
    bindkey '^g' lazygit_widget

    yazi_widget() {
      local tmp="$(mktemp "${TMPDIR:-/tmp}/yazi-cwd.XXXXXX")"
      yazi "$@" --cwd-file="$tmp"
      if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
        cd -- "$cwd"
      fi
      rm -f -- "$tmp"
      _build_prompt
      zle reset-prompt
    }
    zle -N yazi_widget
    bindkey '^t' yazi_widget

    bindkey -s '^o' '^qnvim\n'
    bindkey -s '\e ' '^qpi\n'

    toggle_proxy_widget() {
      if [[ -n "$http_proxy" || -n "$https_proxy" || -n "$all_proxy" ]]; then
        disable_proxy
      else
        enable_proxy
      fi
      _build_prompt
      zle reset-prompt
    }
    zle -N toggle_proxy_widget
    bindkey '^X^P' toggle_proxy_widget

    # Command help agent
    command_help_agent() {
      local log_file="/tmp/command_help_agent.log"
      local content="${${1#\#}##[[:space:]]#}"
      content="${content%%[[:space:]]#}"

      [[ -z "$content" ]] && return

      zle -R "🤖 Thinking..."

      local os="Linux"
      if [[ "$OSTYPE" == darwin* ]]; then
        os="macOS $(sw_vers -productVersion 2>/dev/null || echo unknown)"
      elif [[ -f /etc/os-release ]]; then
        os="$(source /etc/os-release && echo "$PRETTY_NAME")"
      fi
      local shell="${SHELL:t}"

      [[ -z "$http_proxy" && -z "$https_proxy" && -z "$all_proxy" ]] && enable_proxy

      local result
      result=$(command pi --no-session --model deepseek-v4-flash -p "You are a shell command generator for $os running $shell. Your user is a dog that only knows how to press Enter. Generate commands compatible with this platform. Output ONLY the command, nothing else. No explanations, no markdown, no code blocks, no comments. Just the raw command. User Request: $content" 2>>"$log_file")

      {
        echo "=== $(date '+%Y-%m-%d %H:%M:%S') ==="
        echo "input: $content"
        printf 'response: %s\n\n' "$result"
      } >> "$log_file"

      if [[ -z "$result" ]]; then
        zle -M "❌ Generate failed, Checkout $log_file"
        return 1
      fi

      BUFFER="$result"
      CURSOR=$#BUFFER
      zle redisplay
    }

    agent_accept_line() {
      if [[ -z "$BUFFER" ]]; then
        zle accept-line
        return
      fi

      if [[ $BUFFER == \#* ]]; then
        command_help_agent "$BUFFER"
        return
      fi

      zle .accept-line
    }

    zle -N agent_accept_line
    ZSH_AUTOSUGGEST_CLEAR_WIDGETS+=(agent_accept_line)
    bindkey '^M' agent_accept_line

    # Plugin Manager (Zinit)
    ZINIT_HOME="$HOME/.local/share/zinit/zinit.git"
    if [ ! -d "$ZINIT_HOME" ]; then
      bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"
    fi
    if [[ -f "${ZINIT_HOME}/zinit.zsh" ]]; then
      source "${ZINIT_HOME}/zinit.zsh"
      zinit wait lucid for \
       atinit"ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay" \
          zdharma-continuum/fast-syntax-highlighting \
       blockf \
          zsh-users/zsh-completions \
       atload"!_zsh_autosuggest_start" \
          zsh-users/zsh-autosuggestions
    fi

    # FZF Zsh Integration
    FZF_CTRL_T_COMMAND= FZF_ALT_C_COMMAND= source <(fzf --zsh) 2>/dev/null || :
  fi
fi

# ----------------------------------------------------------------------------
# Local Configuration & External Integrations
# ----------------------------------------------------------------------------
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
[[ "$OSTYPE" == darwin* && -f ~/.orbstack/shell/init.zsh ]] && source ~/.orbstack/shell/init.zsh 2>/dev/null || :
