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
if [[ $SHELL != *"fish"* ]]; then
    echo $(which fish) | sudo tee -a /etc/shells
    chsh -s $(which fish)
    success "change default shell to fish"
fi

# Alacritty setup
ln -Fhnvs ~/dotfiles/alacritty ~/.config/alacritty
# Fish setup
ln -Fhnvs ~/dotfiles/fish ~/.config/fish

# # Kitty Setup
ln -Fhnvs ~/dotfiles/kitty ~/.config/kitty
# # Zsh Setup
ln -Fhnvs ~/dotfiles/zsh/p10k.zsh ~/.p10k.zsh
ln -Fhnvs ~/dotfiles/zsh/zshrc ~/.zshrc

# Tmux
ln -Fhnvs ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -Fhnvs ~/dotfiles/tmux/tmux.theme.conf ~/.tmux.theme.conf
# Neovim
ln -Fhnvs ~/dotfiles/nvim ~/.config/nvim
# ideavimrc
ln -Fhnvs ~/dotfiles/_ideavimrc ~/.ideavimrc
# Hammerspoon
ln -Fhnvs ~/dotfiles/hammerspoon ~/.hammerspoon
# git config
ln -Fhnvs ~/dotfiles/git/gitconfig ~/.gitconfig
ln -Fhnvs ~/dotfiles/git/lazygit_config.yml ~/Library/Application\ Support/jesseduffield/lazygit/config.yml
# asdf
ln -Fhnvs ~/dotfiles/asdf/.tool-versions ~/.tool-versions

success "link finished."
