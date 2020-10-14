#!/bin/bash

set -e

green="\e[36m"
blue="\e[34m"
normal="\e[0m"

success () {
    printf "${green}$1${normal}\n"
}

info () {
    printf "${blue}$1${normal}\n"
}

# prerequirments package
packages=(
  iterm2
  git
  zsh
  tmux
  node
  ruby
  python3
  golang
  ripgrep
  fzf
  the_silver_searcher
  z
  fd
  ccat
  highlight
  neovim
  lazygit
  lazynpm
)

for i in "${packages[@]}"
do
  # brew install $i
  # echo "---------------------------------------------------------"
done

# tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    success "install tpm"
fi


ln -fs ./tmux/tmux.conf ~/.tmux.conf

ln -fs ./_ideavimrc ~/.ideavimrc
ln -fs ./nvim ~/.config/nvim

ln -fs ./hammerspoon ~/.hammerspoon

ln -fs ./zsh/p10k.zsh ~/.p10k.zsh
ln -fs ./zsh/zimrc ~/.zimrc
ln -fs ./zsh/zshrc ~/.zshrc

source ~/.zshrc

success "link custom config file to $HOME"

# change default shell to zsh
if [[ $SHELL != *"zsh"* ]]; then
    chsh -s $(which zsh)
    success "change default shell to zsh"
fi
