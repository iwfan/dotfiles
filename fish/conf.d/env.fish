set fish_greeting

set -gx SHELL /usr/local/bin/fish
set -gx GPG_TTY tty

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx MANPAGER "sh -c 'col -bx | bat -l man -p'"

# Homebrew's sbin
fish_add_path /usr/local/sbin
set -gx HOMEBREW_NO_AUTO_UPDATE true
if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

# Go
set -gx GOPATH $HOME/go
set -gx GO111MODULE on
set -gx GOPROXY "https://goproxy.cn"
fish_add_path $GOPATH/bin

# Bat
set -gx BAT_PAGER "less -R"
set -gx BAT_STYLE "changes,numbers"
set -gx BAT_THEME "ansi"

# RG
set -gx RG_OPTIONS "--smart-case --follow"

# Fd
set -gx FD_OPTIONS "--hidden --follow --exclude .git --exclude node_modules"

# Fzf
set -gx DISABLE_FZF_KEY_BINDINGS true
set -gx FZF_DEFAULT_COMMAND "fd -t f $FD_OPTIONS"
set -gx FZF_BASE_OPTS "-m --ansi --height 40% --reverse --info inline --tabstop=4 --prompt 'File❯ ' \
  --bind 'ctrl-r:change-prompt(❯ )+reload(fd $FD_OPTIONS)' \
  --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
  --preview='' --preview-window=''"

set -gx FZF_DEFAULT_OPTS "$FZF_BASE_OPTS \
  --bind 'ctrl-d:change-prompt(Dir❯ )+reload(fd -t d $FD_OPTIONS)' \
  --bind 'ctrl-f:change-prompt(File❯ )+reload(fd -t f $FD_OPTIONS)' \
  --bind 'ctrl-/:toggle-preview' \
  --preview='string match -q \"*binary\" (file --mime {} ); and echo {} is a binary file; or bat --color=always --style=numbers --line-range=:100 {}' \
  --preview-window='right:60%:wrap'"

export LF_ICONS="tw=:st=:ow=:dt=:di=:fi=:ln=:or=:ex=:*.c=:*.cc=:*.clj=:*.coffee=:*.cpp=:*.css=:*.d=:*.dart=:
*.erl=:*.exs=:*.fs=:*.go=:*.h=:*.hh=:*.hpp=:*.hs=:*.html=:*.java=:*.jl=:*.js=:*.json=:*.lua=:*.md=:*.php=:
*.pl=:*.pro=:*.py=:*.rb=:*.rs=:*.scala=:*.ts=:*.vim=:*.cmd=:*.ps1=:*.sh=:*.bash=:*.zsh=:*.fish=:*.tar=:*.tgz=:
*.arc=:*.arj=:*.taz=:*.lha=:*.lz4=:*.lzh=:*.lzma=:*.tlz=:*.txz=:*.tzo=:*.t7z=:*.zip=:*.z=:*.dz=:*.gz=:*.lrz=:
*.lz=:*.lzo=:*.xz=:*.zst=:*.tzst=:*.bz2=:*.bz=:*.tbz=:*.tbz2=:*.tz=:*.deb=:*.rpm=:*.jar=:*.war=:*.ear=:*.sar=:
*.rar=:*.alz=:*.ace=:*.zoo=:*.cpio=:*.7z=:*.rz=:*.cab=:*.wim=:*.swm=:*.dwm=:*.esd=:*.jpg=:*.jpeg=:*.mjpg=:*.mjpeg=:
*.gif=:*.bmp=:*.pbm=:*.pgm=:*.ppm=:*.tga=:*.xbm=:*.xpm=:*.tif=:*.tiff=:*.png=:*.svg=:*.svgz=:*.mng=:*.pcx=:*.mov=:
*.mpg=:*.mpeg=:*.m2v=:*.mkv=:*.webm=:*.ogm=:*.mp4=:*.m4v=:*.mp4v=:*.vob=:*.qt=:*.nuv=:*.wmv=:*.asf=:*.rm=:*.rmvb=:
*.flc=:*.avi=:*.fli=:*.flv=:*.gl=:*.dl=:*.xcf=:*.xwd=:*.yuv=:*.cgm=:*.emf=:*.ogv=:*.ogx=:*.aac=:*.au=:*.flac=:
*.m4a=:*.mid=:*.midi=:*.mka=:*.mp3=:*.mpc=:*.ogg=:*.ra=:*.wav=:*.oga=:*.opus=:*.spx=:*.xspf=:*.pdf=:*.nix=:"
