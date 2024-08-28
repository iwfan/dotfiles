function decode -d "decode base64 string"
  echo "$argv[1]" | base64 -d ;
end
