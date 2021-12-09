# https://zsh.sourceforge.io/Intro/intro_3.html

export XDG_CONFIG_HOME="$HOME/.config"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export DOTFILES="$HOME/dotfiles"
export ZINIT_HOME="${ZDOTDIR:-$HOME}/.zinit"
export ZINIT_BIN_DIR_NAME="bin"
export KEYTIMEOUT=1

# Locale
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export TERM=screen-256color
export GPG_TTY=tty

# History Control
export HISTCONTROL=ignorespace

# Editor
export VISUAL=nvim
export EDITOR="nvim"
export GIT_EDITOR="nvim"
export REACT_EDITOR="nvim"

#Homebrew's sbin
export PATH="/usr/local/sbin:/usr/local/bin:$PATH"
export HOMEBREW_NO_AUTO_UPDATE=true

# ruby
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Go
export GOPATH=$HOME/go
export GO111MODULE="on"
export PATH="$GOPATH/bin:$PATH"
export GOPROXY=https://goproxy.cn

# Rust
export PATH="$HOME/.cargo/bin:$PATH"

# Bat
export BAT_PAGER="less -R"
export BAT_STYLE="changes,numbers"
export BAT_THEME="gruvbox-dark"

# RG
export RG_OPTIONS="--smart-case --follow"

# Fd
export FD_OPTIONS="--hidden --follow --exclude .git --exclude node_modules"

# Fzf
export FZF_DEFAULT_COMMAND="fd $FD_OPTIONS"
export FZF_BASE_OPTS="-m --ansi --height 40% --reverse --info inline --tabstop=4 \
  --bind 'ctrl-r:change-prompt(> )+reload($FZF_DEFAULT_COMMAND)' \
  --bind 'ctrl-o:execute(cd {})' \
  --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
  --preview='' --preview-window=''"

export FZF_DEFAULT_OPTS="$FZF_BASE_OPTS \
  --bind 'ctrl-d:change-prompt(Dirs> )+reload(fd -t d $FD_OPTIONS)' \
  --bind 'ctrl-f:change-prompt(Files> )+reload(fd -t f $FD_OPTIONS)' \
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

export LF_ICONS="\
di=:\
fi=:\
ln=:\
or=:\
ex=:\
*.c=:\
*.cc=:\
*.clj=:\
*.coffee=:\
*.cpp=:\
*.css=:\
*.d=:\
*.dart=:\
*.erl=:\
*.exs=:\
*.fs=:\
*.go=:\
*.h=:\
*.hh=:\
*.hpp=:\
*.hs=:\
*.html=:\
*.java=:\
*.jl=:\
*.js=:\
*.json=:\
*.lua=:\
*.md=:\
*.php=:\
*.pl=:\
*.pro=:\
*.py=:\
*.rb=:\
*.rs=:\
*.scala=:\
*.ts=:\
*.vim=:\
*.cmd=:\
*.ps1=:\
*.sh=:\
*.bash=:\
*.zsh=:\
*.fish=:\
*.tar=:\
*.tgz=:\
*.arc=:\
*.arj=:\
*.taz=:\
*.lha=:\
*.lz4=:\
*.lzh=:\
*.lzma=:\
*.tlz=:\
*.txz=:\
*.tzo=:\
*.t7z=:\
*.zip=:\
*.z=:\
*.dz=:\
*.gz=:\
*.lrz=:\
*.lz=:\
*.lzo=:\
*.xz=:\
*.zst=:\
*.tzst=:\
*.bz2=:\
*.bz=:\
*.tbz=:\
*.tbz2=:\
*.tz=:\
*.deb=:\
*.rpm=:\
*.jar=:\
*.war=:\
*.ear=:\
*.sar=:\
*.rar=:\
*.alz=:\
*.ace=:\
*.zoo=:\
*.cpio=:\
*.7z=:\
*.rz=:\
*.cab=:\
*.wim=:\
*.swm=:\
*.dwm=:\
*.esd=:\
*.jpg=:\
*.jpeg=:\
*.mjpg=:\
*.mjpeg=:\
*.gif=:\
*.bmp=:\
*.pbm=:\
*.pgm=:\
*.ppm=:\
*.tga=:\
*.xbm=:\
*.xpm=:\
*.tif=:\
*.tiff=:\
*.png=:\
*.svg=:\
*.svgz=:\
*.mng=:\
*.pcx=:\
*.mov=:\
*.mpg=:\
*.mpeg=:\
*.m2v=:\
*.mkv=:\
*.webm=:\
*.ogm=:\
*.mp4=:\
*.m4v=:\
*.mp4v=:\
*.vob=:\
*.qt=:\
*.nuv=:\
*.wmv=:\
*.asf=:\
*.rm=:\
*.rmvb=:\
*.flc=:\
*.avi=:\
*.fli=:\
*.flv=:\
*.gl=:\
*.dl=:\
*.xcf=:\
*.xwd=:\
*.yuv=:\
*.cgm=:\
*.emf=:\
*.ogv=:\
*.ogx=:\
*.aac=:\
*.au=:\
*.flac=:\
*.m4a=:\
*.mid=:\
*.midi=:\
*.mka=:\
*.mp3=:\
*.mpc=:\
*.ogg=:\
*.ra=:\
*.wav=:\
*.oga=:\
*.opus=:\
*.spx=:\
*.xspf=:\
*.pdf=:\
*.nix=:\
"
