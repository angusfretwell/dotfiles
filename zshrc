#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh)"

source ~/.config/op/plugins.sh

for file in ~/.{prompt,exports,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
