function killport -d "kill process by port"
  lsof -nP -iTCP -sTCP:LISTEN | grep $argv[1] | awk '{print $2}' | xargs kill
end
