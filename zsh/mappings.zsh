export KEYTIMEOUT=1

bindkey -v
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line

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

# bindkey "^G" _open_lazygit
bindkey -s '^g' 'gitui^M'

_open_lazynpm() {
	zle -I
	(
		lazynpm
	) < /dev/tty
}
zle -N _open_lazynpm

bindkey "^N" _open_lazynpm
