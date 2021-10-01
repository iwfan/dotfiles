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

# Zsh Setup
ln -Fhnvs ~/dotfiles/zsh/.zshenv ~/.config/zsh/.zshenv
ln -Fhnvs ~/dotfiles/zsh/.zprofile ~/.config/zsh/.zprofile
ln -Fhnvs ~/dotfiles/zsh/.zshrc ~/.config/zsh/.zshrc

# Tmux
ln -Fhnvs ~/dotfiles/tmux ~/.config/tmux

# Neovim
ln -Fhnvs ~/dotfiles/nvim ~/.config/nvim
# ideavimrc
ln -Fhnvs ~/dotfiles/ideavim ~/.config/ideavim
# Hammerspoon
defaults write org.hammerspoon.Hammerspoon MJConfigFile "~/.config/hammerspoon/init.lua"
ln -Fhnvs ~/dotfiles/hammerspoon ~/.config/hammerspoon
# karabiner
ln -Fhnvs ~/dotfiles/karabiner ~/.config/karabiner
# git config
ln -Fhnvs ~/dotfiles/git ~/.config/git
ln -Fhnvs ~/dotfiles/git/lazygit_config.yml ~/Library/Application\ Support/lazygit/config.yml

success "link finished."
