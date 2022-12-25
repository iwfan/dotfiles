function disable_proxy -d "turn off proxy"
  set --erase https_proxy
  set --erase http_proxy
  set --erase all_proxy

  echo "proxy is off $http_proxy"
end
