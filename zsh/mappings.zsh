_open_neovim() {
	zle -I
	(
		nvim
	) < /dev/tty
}
zle -N _open_neovim

bindkey "^V" _open_neovim

_open_lazygit() {
	zle -I
	(
		lazygit
	) < /dev/tty
}
zle -N _open_lazygit

bindkey "^G" _open_lazygit

_open_lazynpm() {
	zle -I
	(
		lazynpm
	) < /dev/tty
}
zle -N _open_lazynpm

bindkey "^N" _open_lazynpm
