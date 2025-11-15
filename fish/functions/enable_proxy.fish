function enable_proxy -d "turn on proxy"
  set -gx https_proxy "http://127.0.0.1:7890"
  set -gx http_proxy "http://127.0.0.1:7890"
  set -gx all_proxy "socks5://127.0.0.1:7890"

  npm config set proxy "http://127.0.0.1:7890"
  npm config set https-proxy "http://127.0.0.1:7890"

  echo "proxy is on, $http_proxy"
end
