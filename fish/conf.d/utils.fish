function at
  tmux attach -t f || tmux new -s f
end

function proxy_on
    set -Ux http_proxy  http://127.0.0.1:7890
    set -Ux https_proxy http://127.0.0.1:7890
    set -Ux all_proxy   socks5://127.0.0.1:7890
end

function proxy_off
    set -Ux http_proxy
    set -Ux https_proxy
    set -Ux all_proxy
end

function grebase
    set -l branch $argv[1]
    set -q branch[1]
    or set branch main

    echo "==> Checking out $branch..."
    git checkout $branch
    echo ""
    echo "==> Updating main..."
    git pull
    echo ""
    echo "==> Checking back to original branch"
    git checkout -
    echo ""
    echo "==> Rebasing main onto (git rev-parse --abbrev-ref HEAD)"
    git rebase main (git rev-parse --abbrev-ref HEAD)
    echo ""
end

# npm install global package
function nigp
  npm i -g \
    pnpm \
    npkill \
    live-server \
    tldr
end
