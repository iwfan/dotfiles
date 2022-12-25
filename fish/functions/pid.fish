function pid -d "find command by pid"
  ps -Ao user,pid,command | grep -v grep | grep $argv[1]
end
