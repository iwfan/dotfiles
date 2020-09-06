#!/usr/bin/env bash


#packages=(
  #"git"
  #"node"
  #"ruby"
  #"tmux"
  #"neovim"
  #"python3"
  #"zsh"
  #"ripgrep"
  #"fzf"
  #"z"
# lazygit
# lazynpm
# ccat
# highlight
#)

#for i in "${packages[@]}"
#do
  #brew install $i
  #echo "---------------------------------------------------------"
#done

export Oh_My_ZSH_PLUG_DIR=$HOME/.oh-my-zsh
if [[ ! -d $Oh_My_ZSH_PLUG_DIR ]]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

rm ~/.zshrc
ln -s ~/dotfiles/zsh/zshrc ~/.zshrc
source ~/.zshrc

ln -s ~/dotfiles/nvim ~/.config/nvim
