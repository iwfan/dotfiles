GlobalPkgList=(
    "typescript"
    "prettier"
    "eslint"
    "eslint_d"
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
