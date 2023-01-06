function lfi
    lf
    set file "/Users/f/dotfiles/lf/temp_dir"
    if test -f "$file"
        set dir (cat $file)
        /bin/rm -f $file
        if test -d "$dir"
            if test "$dir" != (pwd)
                commandline -r "cd $dir"
                commandline -f execute
            end
        end
    end
end
