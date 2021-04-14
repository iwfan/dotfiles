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
  curl
  wget
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
  ranger
#  lazynpm
  diff-so-fancy
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

ln -fs ~/dotfiles/git/gitconfig ~/.gitconfig
ln -fs ~/dotfiles/git/lazygit_config.yml ~/Library/Application\ Support/jesseduffield/lazygit/config.yml
ln -fs ~/dotfiles/kitty ~/.config/kitty

# tmux
ln -fs ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -fs ~/dotfiles/tmux/tmux.theme.conf ~/.tmux.theme.conf

# ideavimrc
ln -fs ~/dotfiles/_ideavimrc ~/.ideavimrc

# neovim
ln -fs ~/dotfiles/nvim ~/.config/nvim

ln -fs ~/dotfiles/ranger ~/.config/ranger

# hammerspoon
ln -fs ~/dotfiles/hammerspoon ~/.hammerspoon

ln -fs ~/dotfiles/zsh/p10k.zsh ~/.p10k.zsh
ln -fs ~/dotfiles/zsh/p10k-evilball.zsh ~/.p10k-evilball.zsh
ln -fs ~/dotfiles/zsh/zshrc ~/.zshrc

ln -fs ~/dotfiles/efm-langserver ~/.config/efm-langserver

success "link custom config file to $HOME"

#source ~/.zshrc
