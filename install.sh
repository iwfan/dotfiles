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
ln -s ~/dotfiles/zsh/.zshrc ~/.zshrc
# Tmux config
ln -s ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
# yazi
ln -s ~/dotfiles/yazi ~/.config/yazi
# Neovim
ln -s ~/dotfiles/nvim ~/.config/nvim
# git config
ln -s ~/dotfiles/git ~/.config/git
ln -s ~/dotfiles/git/lazygit_config.yml ~/Library/Application\ Support/lazygit/config.yml
# Rime
ln -s ~/dotfiles/rime-ice ~/Library/Rime
ln -s ~/dotfiles/rime-ice ~/.config/ibus/rime

success "link finished."
