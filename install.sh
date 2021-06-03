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

# enable repeating keys on press and hold
defaults write -g ApplePressAndHoldEnabled 0
defaults write com.apple.Finder AppleShowAllFiles true

# ###########################################################
# Install non-brew various tools (PRE-BREW Installs)
# ###########################################################
info "ensuring build/install tools are available"
if ! xcode-select --print-path &> /dev/null; then

    # Prompt user to install the XCode Command Line Tools
    xcode-select --install &> /dev/null

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Wait until the XCode Command Line Tools are installed
    until xcode-select --print-path &> /dev/null; do
        sleep 5
    done

    info $? ' XCode Command Line Tools Installed'

    # Prompt user to agree to the terms of the Xcode license
    # https://github.com/alrra/dotfiles/issues/10

    sudo xcodebuild -license
    info $? 'Agree with the XCode Command Line Tools licence'

fi

# ###########################################################
# install homebrew (CLI Packages)
# ###########################################################

info "checking homebrew..."
brew_bin=$(which brew) 2>&1 > /dev/null
if [[ $? != 0 ]]; then
  action "installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  if [[ $? != 0 ]]; then
    info "unable to install homebrew, script $0 abort!"
    exit 2
  fi
fi

# Kitty Setup
ln -Fhnvs ~/dotfiles/kitty ~/.config/kitty
# Zsh Setup
ln -Fhnvs ~/dotfiles/zsh/.zshenv ~/.zshenv
ln -Fhnvs ~/dotfiles/zsh/.zprofile ~/.zprofile
ln -Fhnvs ~/dotfiles/zsh/.zshrc ~/.zshrc
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
ln -Fhnvs ~/dotfiles/git/lazygit_config.yml ~/Library/Application\ Support/lazygit/config.yml
# asdf
ln -Fhnvs ~/dotfiles/asdf/.tool-versions ~/.tool-versions

success "link finished."
