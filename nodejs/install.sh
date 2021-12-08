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
    "graphql-language-service-cli"
    "vls"
    "yarn"
    "pnpm"
    "live-server"
    "firebase-tools"
    "@marp-team/marp-cli"
    "zx"
)

for pkg in ${GlobalPkgList[*]}; do
     echo "npm install -g $pkg"
     npm install -g $pkg
done
