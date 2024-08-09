function disable_proxy -d "turn off proxy"
  set --erase https_proxy
  set --erase http_proxy
  set --erase all_proxy

  npm config delete proxy
  npm config delete https-proxy

  echo "proxy is off $http_proxy"
end
