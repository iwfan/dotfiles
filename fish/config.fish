source /usr/local/opt/asdf/libexec/asdf.fish

starship init fish | source

mcfly init fish | source
set -gx MCFLY_FUZZY 2
set -gx MCFLY_INTERFACE_VIEW BOTTOM

if status is-interactive
    # Commands to run in interactive sessions can go here
end
