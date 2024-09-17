function lfcd
    set -l tmp "$HOME/dotfiles/lf/temp_dir"
    command lf $argv
    if test -f "$tmp"
        set dir (/bin/cat $tmp)
        /bin/rm -f $tmp
        if test -d "$dir"
            if test "$dir" != (pwd)
                commandline -r "cd $dir"
                commandline -f execute
            end
        end
    end
end
