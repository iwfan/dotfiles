source /usr/local/opt/asdf/libexec/asdf.fish

set -gx STARSHIP_CONFIG $HOME/dotfiles/starship/starship.toml
starship init fish | source

set -gx MCFLY_FUZZY 2
set -e MCFLY_INTERFACE_VIEW
mcfly init fish | source

enable_proxy

if status is-interactive
    # Commands to run in interactive sessions can go here
end
