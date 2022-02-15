function fif -d "find-in-file - usage: fif <searchTerm>"
  if test (count $argv) -eq 0
    echo "Need a string to search for!"
    return 1
  end

  set -l file (rg --files-with-matches --no-messages "$argv[1]" | fzf --preview "rg --colors 'match:bg:yellow' --ignore-case --pretty --context 10 '$argv[1]' || rg --ignore-case --pretty --context 10 '$argv[1]' {}")

  if test -n "$file"
    $EDITOR "$file"
  end
end
