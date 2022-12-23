source /usr/local/opt/asdf/libexec/asdf.fish

set -gx MCFLY_FUZZY 2
set -e MCFLY_INTERFACE_VIEW
mcfly init fish | source
zoxide init fish | source
starship init fish | source
