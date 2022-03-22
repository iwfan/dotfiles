function runscheme -d "Run scheme file"
  if test (count $argv) -eq 0
    echo "Need a file to run!"
    return 1
  end

  scheme --quiet < "$argv[1]"
end
