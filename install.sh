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
ln -s ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -s ~/dotfiles/zsh/.zshrc ~/.config/zsh/.zshrc
# fish-shell
ln -s ~/dotfiles/fish ~/.config/fish
# kitty
ln -s ~/dotfiles/kitty ~/.config/kitty
# lf
ln -s ~/dotfiles/joshuto ~/.config/joshuto
# Neovim
ln -s ~/dotfiles/nvim ~/.config/nvim
# ideavimrc
ln -s ~/dotfiles/ideavim ~/.config/ideavim
# starship prompt
ln -s ~/dotfiles/starship/starship.toml ~/.config/starship.toml
# git config
ln -s ~/dotfiles/git ~/.config/git
ln -s ~/dotfiles/git/lazygit_config.yml ~/Library/Application\ Support/lazygit/config.yml

success "link finished."
