#!/usr/bin/env bash
file=$1
w=$2
h=$3
x=$4
y=$5

filetype="$( file -Lb --mime-type "$file")"

case $f in
    *.md) glow --local --style=auto --width="${w}" "$1" && exit 1;;
esac

if [[ "$filetype" =~ ^text ]]; then
    bat -P -p --terminal-width "$4" -f "$1"
    exit 1
fi

if [[ "$filetype" =~ json$ ]]; then
    jq -C . "$1"
    exit 1
fi

if [[ "$filetype" =~ ^image ]]; then
    kitty +kitten icat --silent --stdin no --transfer-mode file --place "${w}x${h}@${x}x${y}" "$file" < /dev/null > /dev/tty
    exit 1
fi
