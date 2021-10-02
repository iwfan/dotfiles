export KEYTIMEOUT=1

bindkey -v
bindkey -M vicmd "H" vi-beginning-of-line
bindkey -M vicmd "L" vi-end-of-line

# ctrl-z
fancy-ctrl-z () {
if [[ $#BUFFER -eq 0 ]]; then
  BUFFER="fg"
  zle accept-line
else
  zle push-input
  zle clear-screen
fi
}
zle -N fancy-ctrl-z
bindkey '^Z' fancy-ctrl-z

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
