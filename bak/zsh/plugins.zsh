export SPACE_ZSH_PLUGIN_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt
if [[ ! -d $SPACE_ZSH_PLUGIN_DIR ]]; then
  git clone https://github.com/denysdovhan/spaceship-prompt.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship-prompt" --depth=1
  ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/spaceship.zsh-theme" 
fi

export ZSH_COMPLETIONS_PLUGIN_DIR=${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
if [[ ! -d $ZSH_COMPLETIONS_PLUGIN_DIR ]]; then
  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
fi

export ZSH_AUTO_SUGGESTIONS_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
if [[ ! -d $ZSH_AUTO_SUGGESTIONS_DIR ]]; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

export ZSH_SYNTAX_HIGHTLIGHT_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
if [[ ! -d $ZSH_SYNTAX_HIGHTLIGHT_DIR ]]; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

export ZSH_SUBSTRING_SEARCH_DIR=${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
if [[ ! -d $ZSH_SUBSTRING_SEARCH_DIR ]]; then
  git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
fi

plugins=(
  git
	nvm
	node
	npm
	yarn
	z
	man
	iterm2
	history
	history-substring-search
	brew
	fzf
	zsh-autosuggestions
	zsh-syntax-highlighting
	zsh-completions
)
