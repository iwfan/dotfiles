#!/usr/bin/env bash

file=$1
w=$2
h=$3
x=$4
y=$5

# echo $( file -Lb --mime-type $file)

if [[ "$( file -Lb --mime-type "$file")" =~ ^text ]]; then
    bat --terminal-width "$4" -f "$1"
    exit 1
fi

if [[ "$( file -Lb --mime-type "$file")" =~ xml$ ]]; then
    bat --terminal-width "$4" -f "$1"
    exit 1
fi

if [[ "$( file -Lb --mime-type "$file")" =~ json$ ]]; then
    bat --terminal-width "$4" -f "$1"
    exit 1
fi

if [[ "$( file -Lb --mime-type "$file")" =~ ^image ]]; then
    kitty +icat --silent --transfer-mode file --place "${w}x${h}@${x}x${y}" "$file"
    exit 1
fi
