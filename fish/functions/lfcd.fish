function lfcd
    set -l tmp $(mktemp)
    command lf -last-dir-path=$tmp $argv
    if test -f "$tmp"
        set dir (cat $tmp)
        /bin/rm -f $tmp
        if test -d "$dir"
            if test "$dir" != (pwd)
                commandline -r "cd $dir"
                commandline -f execute
            end
        end
    end
end
