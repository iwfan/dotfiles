at() {
  tmux attach -t f || tmux new -s f
}

enable_proxy() {
    set -x https_proxy http://127.0.0.1:7890
    set -x http_proxy  http://127.0.0.1:7890
    set -x all_proxy   socks5://127.0.0.1:7890
}

disable_proxy() {
    set -x https_proxy
    set -x http_proxy
    set -x all_proxy
}
