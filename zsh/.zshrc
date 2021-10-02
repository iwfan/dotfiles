# https://zsh.sourceforge.io/Intro/intro_3.html

setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.

source ~/dotfiles/zsh/zinit.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/mappings.zsh
test -e /Users/f/.iterm2_shell_integration.zsh && source /Users/f/.iterm2_shell_integration.zsh || true

enable_proxy
