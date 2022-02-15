function port -d "find process by port"
  lsof -nP -iTCP -sTCP:LISTEN | grep $argv[1]
end
