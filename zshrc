#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

for file in ~/.{path,prompt,exports,aliases,functions,extra}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
