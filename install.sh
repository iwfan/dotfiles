#!/usr/bin/env bash

# lazygit
# lazynpm
# ccat
# highlight


export Oh_My_ZSH_PLUG_DIR=$HOME/.oh-my-zsh
if [[ ! -d $Oh_My_ZSH_PLUG_DIR ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

rm ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
source ~/.zshrc