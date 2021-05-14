#!/usr/bin/env bash
BASE=$(git rev-parse --show-toplevel)
LSP_BIN_PATH=$HOME/.local/bin
get_platform() {
  case "$(uname -s)" in
  Linux*) platform=Linux ;;
  Darwin*) platform=Mac ;;
  CYGWIN*) platform=Cygwin ;;
  MINGW*) platform=MinGw ;;
  *) platform="UNKNOWN:${unameOut}" ;;
  esac
  echo $platform
}

install_node_deps() {
  if [[ -z $(which npm) ]]; then
    echo "npm not installed"
    return
  fi
  npm install -g $@
}

install_ts() {
  install_node_deps typescript typescript-language-server prettier
}

install_html() {
  install_node_deps vscode-html-languageserver-bin
}

install_css() {
  install_node_deps vscode-css-languageserver-bin
}

install_json() {
  install_node_deps vscode-json-languageserver
}

install_python() {
  install_node_deps pyright
}

install_bash() {
  install_node_deps bash-language-server
}

install_lua() {
    git clone https://github.com/sumneko/lua-language-server ~/.config/lua-language-server
    ( cd ~/.config/lua-language-server/ && git submodule update --init --recursive )

    #linux only
    (cd ~/.config/lua-language-server/3rd/luamake/ && compile/install.sh)
    (cd ~/.config/lua-language-server/ &&  ./3rd/luamake/luamake rebuild)
}

install_rust() {
  if [[ ! -e ~/.local/bin/rust-analyzer ]]; then
    mkdir -p ${LSP_BIN_PATH}
    curl -L https://github.com/rust-analyzer/rust-analyzer/releases/latest/download/rust-analyzer-$(get_platform) -o ~/.local/bin/rust-analyzer
    chmod +x ~/.local/bin/rust-analyzer
  else
    echo "already installed"
  fi
}

npm install -g dockerfile-language-server-nodejs
npm install -g vls
npm install -g yaml-language-server
GO111MODULE=on go get golang.org/x/tools/gopls@latest
