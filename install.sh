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

#brew install iterm2
#brew tap homebrew/cask-fonts && brew cask install font-sauce-code-pro-nerd-font

packages=(
  git
  zsh
  tmux
  node
  yarn
  golang
#  python3
#  ruby
  ripgrep
  fzf
  the_silver_searcher
  z
  fd
  lsd
  ccat
  highlight
  neovim
  lazygit
#  lazynpm
)

for i in "${packages[@]}"
do
  #brew install $i
  echo "---------------------------------------------------------"
done

# change default shell to zsh
if [[ $SHELL != *"zsh"* ]]; then
    chsh -s $(which zsh)
    success "change default shell to zsh"
fi

# tmux
ln -fs ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

# ideavimrc
ln -fs ~/dotfiles/_ideavimrc ~/.ideavimrc

# neovim
ln -fs ~/dotfiles/nvim ~/.config/nvim

# hammerspoon
ln -fs ~/dotfiles/hammerspoon ~/.hammerspoon

ln -fs ~/dotfiles/zsh/p10k.zsh ~/.p10k.zsh
ln -fs ~/dotfiles/zsh/zshrc ~/.zshrc

success "link custom config file to $HOME"

#source ~/.zshrc
