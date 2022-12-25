# Modified version where you can press
#   - CTRL-O to open with `open` command,
#   - CTRL-E or Enter key to open with the $EDITOR
function fo -d "fast open file"
  if test (count $argv) -eq 0
    echo "Need a string to search for!"
    return 1
  end

  set -l IFS (echo -e '\n')
  set -l out (fzf --query="$argv[1]" -0 -1 --expect=ctrl-o,ctrl-e)

  if test -n $out[2]
    if test $out[1] = "ctrl-o"
      open $out[2]
    else
      $EDITOR $out[2]
    end
  end
end
