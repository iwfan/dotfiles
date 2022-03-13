#!/bin/sh

# File preview handler for lf.

case "$(file --dereference --brief --mime-type -- "$1")" in
  # image/*) kitty +kitten icat "$1" ;;
  # image/*) viu "$1" ;;  # It's working but it's not the best way.
  text/* | */xml) bat --terminal-width "$4" -f "$1" ;;
esac

exit 1
