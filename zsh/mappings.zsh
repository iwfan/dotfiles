export KEYTIMEOUT=1

bindkey -v
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line
bindkey -M vicmd v edit-command-line

bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^X^E" edit-command-line
bindkey "^P" history-beginning-search-backward
bindkey "^N" history-beginning-search-forward

_open_neovim() {
	zle -I
	(
		nvim
	) < /dev/tty
}
zle -N _open_neovim

bindkey "^V" _open_neovim
bindkey -s '^o' 'nvim $(fzf)^M'

_open_lazygit() {
	zle -I
	(
		lazygit
	) < /dev/tty
}
zle -N _open_lazygit

bindkey "^G" _open_lazygit
