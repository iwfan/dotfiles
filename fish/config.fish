source /usr/local/opt/asdf/libexec/asdf.fish

zoxide init fish | source
starship init fish | source

# pnpm
set -gx PNPM_HOME "/Users/f/Library/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end