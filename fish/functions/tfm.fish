function tfm
    set -l OUTPUT_FILE $(mktemp)
    joshuto --output-file "$OUTPUT_FILE" $argv

    set exit_code $status

    switch $exit_code
        case 0
            # regular exit
            # do nothing
        case 101
            # output contains current directory
            set JOSHUTO_CWD (cat "$OUTPUT_FILE")
            commandline -r "cd $JOSHUTO_CWD"
            commandline -f execute
        case 102
            # output selected files
            # do nothing
        case '*'
            echo "Exit code: $exit_code"
    end

    /bin/rm -f "$OUTPUT_FILE"
end
