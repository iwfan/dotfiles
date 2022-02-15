set fish_greeting

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx LANG en_US.UTF-8
set -gx LC_ALL en_US.UTF-8

set -gx TERMINAL kitty
set -gx COLORTERM truecolor
set -gx TERM screen-256color
set -gx GPG_TTY tty
set -gx SHELL /usr/local/bin/fish
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim
set -gx REACT_EDITOR nvim
set -gx PAGER most

set -gx VIRTUAL_ENV_DISABLE_PROMPT true
set -gx HOMEBREW_NO_AUTO_UPDATE true

set -gx RUBY_CONFIGURE_OPTS "--with-openssl-dir=(brew --prefix openssl@1.1)"

bind \cg 'lazygit'
bind \cv 'nvim'
bind \cf 'lf'


alias doc "$HOME/Documents"
alias dow "$HOME/Downloads"
alias dot "$HOME/dotfiles"

alias c 'pbcopy'
alias d 'dirs -v'

alias v "nvim"
alias vi "nvim"

alias ls "exa --long --git --modified --color-scale --icons --group-directories-first --time-style=iso"
alias la "ls -a"
alias lt "exa -a --icons --color-scale --tree -L 2 "
alias cp 'cp -iv'
alias mv 'mv -iv'
alias rm "trash -v"

alias n "pnpm"
alias i "pnpm install --prefer-offline"
alias nlsg "npm list -g --depth=0"
alias y "yarn"
alias yb "yarn run build"
alias ys "yarn run start"
alias yd "yarn run dev"
alias yt "yarn run test"

alias sskq "bundle exec sidekiq -C config/sidekiq.yml"
alias rs "GRAPHQL_CONSUMER_ORIGINS='localhost:3001, localhost:1215' bundle exec rails s"


starship init fish | source
source /usr/local/opt/asdf/libexec/asdf.fish

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
