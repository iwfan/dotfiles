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
ln -Fhnvs ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -Fhnvs ~/dotfiles/zsh/.zshrc ~/.config/zsh/.zshrc

# kitty
ln -Fhnvs ~/dotfiles/kitty ~/.config/kitty
# lf
ln -Fhnvs ~/dotfiles/lf ~/.config/lf
# Tmux
ln -Fhnvs ~/dotfiles/tmux ~/.config/tmux
# Neovim
ln -Fhnvs ~/dotfiles/nvim ~/.config/nvim

ln -Fhnvs ~/dotfiles/yabai ~/.config/yabai
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
