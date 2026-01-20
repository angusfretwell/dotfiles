#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh)"

source ~/.op/plugins.sh

for file in ~/.{prompt,exports,aliases,functions}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
