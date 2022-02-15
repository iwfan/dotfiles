function j -d "jump to anywhere"
  if test (count $argv) -eq 0
    echo "Need a string to search for!"
    return 1
  end

  set -g _last_z_args "$argv[1]"
  z "$argv[1]"
end
