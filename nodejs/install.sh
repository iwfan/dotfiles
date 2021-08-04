GlobalPkgList=(
    "typescript"
    "prettier"
    "eslint"
    "eslint_d"
    "typescript-language-server"
    "vscode-langservers-extracted"
    "@tailwindcss/language-server"
    "yaml-language-server"
    "diagnostic-languageserver"
    "dockerfile-language-server-nodejs"
    "bash-language-server"
    "vls"
    "yarn"
    "live-server"
    "firebase-tools"
    "@marp-team/marp-cli"
)

for pkg in ${GlobalPkgList[*]}; do
     echo "npm install -g $pkg"
done
