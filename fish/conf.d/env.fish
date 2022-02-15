set fish_greeting

set -gx TERMINAL kitty
set -gx SHELL /usr/local/bin/fish
set -gx TERM screen-256color
set -gx COLORTERM truecolor
set -gx GPG_TTY tty

set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx PAGER most

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
set -gx BAT_THEME "gruvbox-dark"

# RG
set -gx RG_OPTIONS "--smart-case --follow"

# Fd
set -gx FD_OPTIONS "--hidden --follow --exclude .git --exclude node_modules"

# Fzf
set -gx DISABLE_FZF_KEY_BINDINGS true
set -gx FZF_DEFAULT_COMMAND "fd $FD_OPTIONS"
set -gx FZF_BASE_OPTS "-m --ansi --height 40% --reverse --info inline --tabstop=4 \
  --bind 'ctrl-r:change-prompt(> )+reload($FZF_DEFAULT_COMMAND)' \
  --bind 'ctrl-o:execute(cd {})' \
  --bind 'ctrl-y:execute-silent(echo {} | pbcopy)+abort' \
  --preview='' --preview-window=''"

set -gx FZF_DEFAULT_OPTS "$FZF_BASE_OPTS \
  --bind 'ctrl-d:change-prompt(Dirs> )+reload(fd -t d $FD_OPTIONS)' \
  --bind 'ctrl-f:change-prompt(Files> )+reload(fd -t f $FD_OPTIONS)' \
  --bind 'ctrl-/:toggle-preview' \
  --preview='[[ \$(file --mime {}) =~ binary ]] && echo {} is a binary file \
  || (bat --color=always --style=numbers --line-range=:500 {} || cat {}) 2> /dev/null | head -300' \
  --preview-window='right:60%:wrap'"

set -gx LF_ICONS "di=:ln=:ex=:fi=:*.ml=λ:*.mli=λ:*.styl=:*.scss=:*.py=:*.pyc=:*.pyd=:*.pyo=:*.php=:*.markdown=:*.md=:*.json=:*.js=:*.bmp=:*.gif=:*.ico=:*.jpeg=:*.jpg=:*.png=:*.svg=:*.svgz=:*.tga=:*.tiff=:*.xmb=:*.xcf=:*.xpm=:*.xspf=:*.xwd=:*.cr2=:*.dng=:*.3fr=:*.ari=:*.arw=:*.bay=:*.crw=:*.cr3=:*.cap=:*.data=:*.dcs=:*.dcr=:*drf=:*.eip=:*.erf=:*.fff=:*.gpr=:*.iiq=:*.k25=:*.kdc=:*.mdc=:.*mef=:*.mos=:.*.mrw=:.*.obm=:*.orf=:*.pef=:*.ptx=:*.pxn=:*.r3d=:*.raf=:*.raw=:*.rwl=:*.rw2=:*.rwz=:*.sr2=:*.srf=:*.srf=:*.srw=:*.tif=:*.x3f=:*.ejs=:*.htm=:*.html=:*.slim=:*.xml=:*.mustasche=:*.css=:*.less=:*.bat=:*.conf=:*.ini=:*.rc=:*.yml=:*.cfg=:*.rc=:*.rss=:*.coffee=:*.twig=:*.c++=:*.cc=:*.c=:*.cpp=:*.cxx=:*.c=:*.h=:*.hs=:*.lhs=:*.lua=:*.jl=:*.go=:*.ts=:*.db=:*.dump=:*.sql=:*.sln=:*.suo=:*.exe=:*.diff=:*.sum=:*.md5=:*.sha512=:*.scala=:*.java=:*.jar=:*.xul=:*.clj=:*.cljc=:*.pl=:*.pm=:*.t=:*.cljs=:*.edn=:*.rb=:*.fish=:*.sh=:*.bash=:*.dart=:*.f#=:*.fs=:*.fsi=:*.fsscript=:*.fsx=:*.rlib=:*.rs=:*.d=:*.erl=:*.hrl=:*.ai=:*.psb=:*.psd=:*.jsx=:*.vim=:*.vimrc=:*.aac=:*.anx=:*.asf=:*.au=:*.axa=:*.flac=:*.m2a=:*.m4a=:*.mid=:*.midi=:*.mp3=:*.mpc=:*.oga=:*.ogg=:*.ogx=:*.ra=:*.ram=:*.rm=:*.spx=:*.wav=:*.wma=:*.ac3=:*.avi=:*.flv=:*.mkv=:*.mov=:*.mov=:*.mp4=:*.mpeg=:*.mpg=:*.webm=:*.epub=:*.pdf=:*.fb2=:*.djvu=:*.7z=:*.apk=:*.bz2=:*.cab=:*.cpio=:*.deb=:*.gem=:*.gz=:*.gzip=:*.lh=:*.lzh=:*.lzma=:*.rar=:*.rpm=:*.tar=:*.tgz=:*.xz=:*.zip=:*.cbr=:*.cbz=:*.log=:*.doc=:*.docx=:*.adoc=:*.xls=:*.xls=:*.xlsmx=:*.pptx=:*.ppt=:*.Xdefaults=:*.Xresources=:*.bashprofile=:*.bash_profile=:*.bashrc=:*.dmrc=:*.d_store=:*.fasd=:*.gitconfig=:*.gitignore=:*.jack-settings=:*.mime.types=:*.nvidia-settings-rc=:*.pam_environment=:*.profile=:*.recently-used=:*.selected_editor=:*.xinitpurc=:*.zprofile=:*.yarnc=:*.snclirc=:*.tmux.conf=:*.urlview=:*.config=:*.ini=:*.user-dirs.dirs=:*.mimeapps.list=:*.offlineimaprc=:*.msmtprc=:*.Xauthority=:*.config=sub=:srt=:idx=:*.mbsyncrc=:*lfrc="
