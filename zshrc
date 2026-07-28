#!/bin/zsh

source ~/.exports

eval "$(/opt/homebrew/bin/brew shellenv)"

source "$(brew --prefix)/opt/antidote/share/antidote/antidote.zsh"
antidote load

source ~/.op/plugins.sh

source ~/.aliases

if command -v wt >/dev/null 2>&1; then
	eval "$(command wt config shell init zsh)"
fi

if command -v micro >/dev/null 2>&1; then
	alias micro="micro -colorscheme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo cursor-dark || echo cursor-light)"
fi
