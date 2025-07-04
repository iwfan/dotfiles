# Ensure path arrays do not contain duplicates.
typeset -gU path fpath

path=(
  $HOME/{,s}bin(N)
  $HOME/.local/{,s}bin(N)
  /opt/{homebrew,local}/{,s}bin(N)
  /usr/local/{,s}bin(N)
  $path
)

fpath=(
  # Add curl completions from homebrew.
  /{usr/local,opt/homebrew}/opt/curl/share/zsh/site-functions(-/FN)

  # Add zsh completions.
  /{usr/local,opt/homebrew}/share/zsh/site-functions(-/FN)

  # rest of fpath
  $fpath
)

# Added by OrbStack: command-line tools and integration
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
