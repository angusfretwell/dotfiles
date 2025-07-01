#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(mise activate zsh)"

for file in ~/.{prompt,exports,aliases}; do
  [ -r "$file" ] && [ -f "$file" ] && source "$file"
done
