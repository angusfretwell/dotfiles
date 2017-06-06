#!/usr/bin/env bash

# shellcheck disable=SC1090
source "$(brew --prefix)/share/antigen/antigen.zsh"
# shellcheck disable=SC1090
source "$(brew --prefix)/etc/profile.d/z.sh"

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Load common bundles
antigen bundles <<EOBUNDLES
osx
mafredri/zsh-async
sindresorhus/pure
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

export EDITOR='nano'
export PATH="/usr/local/bin:$HOME/.bin:$PATH"

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1090
source "$(brew --prefix nvm)/nvm.sh"

eval "$(rbenv init - --no-rehash)"
