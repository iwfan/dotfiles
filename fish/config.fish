source /usr/local/opt/asdf/libexec/asdf.fish
starship init fish | source
mcfly init fish | source
set -gx MCFLY_FUZZY 2
set -gx MCFLY_INTERFACE_VIEW BOTTOM

if test -d (brew --prefix)"/share/fish/completions"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/completions
end

if test -d (brew --prefix)"/share/fish/vendor_completions.d"
    set -gx fish_complete_path $fish_complete_path (brew --prefix)/share/fish/vendor_completions.d
end

if status is-interactive
    # Commands to run in interactive sessions can go here
end
