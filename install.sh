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
  golang
#  python3
#  ruby
  ripgrep
  fzf
  the_silver_searcher
  z
  fd
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

# tpm
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    success "install tpm"
fi

# zimfw

if [ ! -d ~/.zim ]; then
    curl -fsSL https://raw.githubusercontent.com/zimfw/install/master/install.zsh | zsh
    success "install zimfw"
fi


rm ~/.tmux.conf
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf

rm ~/.ideavimrc
ln -s ~/dotfiles/_ideavimrc ~/.ideavimrc

rm -rf ~/.config/nvim
ln -s ~/dotfiles/nvim ~/.config/nvim

rm -rf ~/.hammerspoon
ln -s ~/dotfiles/hammerspoon ~/.hammerspoon

rm ~/.p10k.zsh ~/.zimrc ~/.zshrc
ln -s ~/dotfiles/zsh/p10k.zsh ~/.p10k.zsh
ln -s ~/dotfiles/zsh/zimrc ~/.zimrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc

success "link custom config file to $HOME"

#source ~/.zshrc
