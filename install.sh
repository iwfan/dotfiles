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

# change default shell to zsh
if [[ $SHELL != *"zsh"* ]]; then
    chsh -s $(which zsh)
    success "change default shell to zsh"
fi

# Kitty Setup
ln -fs ~/dotfiles/kitty ~/.config/kitty
#ln -fs ~/dotfiles/alacritty ~/.config/alacritty
# Zsh Setup
ln -fs ~/dotfiles/zsh/p10k.zsh ~/.p10k.zsh
ln -fs ~/dotfiles/zsh/zshrc ~/.zshrc
# Tmux
ln -fs ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -fs ~/dotfiles/tmux/tmux.theme.conf ~/.tmux.theme.conf
# Neovim
ln -fs ~/dotfiles/nvim ~/.config/nvim
# ideavimrc
ln -fs ~/dotfiles/_ideavimrc ~/.ideavimrc
# Hammerspoon
ln -fs ~/dotfiles/hammerspoon ~/.hammerspoon
# git config
ln -fs ~/dotfiles/git/gitconfig ~/.gitconfig
ln -fs ~/dotfiles/git/lazygit_config.yml ~/Library/Application\ Support/jesseduffield/lazygit/config.yml
# asdf
ln -fs ~/dotfiles/asdf/.tool-versions ~/.tool-versions

success "link finished."
