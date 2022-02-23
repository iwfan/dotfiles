setopt AUTO_CD              # Go to folder path without using cd.
setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.

source ~/dotfiles/zsh/zinit.zsh
source ~/dotfiles/zsh/aliases.zsh
source ~/dotfiles/zsh/functions.zsh
source ~/dotfiles/zsh/mappings.zsh

source /usr/local/opt/asdf/libexec/asdf.sh
