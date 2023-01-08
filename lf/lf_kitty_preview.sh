#!/usr/bin/env bash
file=$1
w=$2
h=$3
x=$4
y=$5

filetype="$( file -Lb --mime-type "$file")"

if [[ "$filetype" =~ ^text ]]; then
    bat --terminal-width "$4" -f "$1"
    exit 1
fi

if [[ "$filetype" =~ xml$ ]]; then
    bat --terminal-width "$4" -f "$1"
    exit 1
fi

if [[ "$filetype" =~ json$ ]]; then
    bat --terminal-width "$4" -f "$1"
    exit 1
fi

if [[ "$filetype" =~ ^image ]]; then
    kitty +icat --silent --transfer-mode file --place "${w}x${h}@${x}x${y}" "$file"
    exit 1
fi
