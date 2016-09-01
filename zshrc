#!/usr/bin/env bash

# shellcheck disable=SC1090
source "$(brew --prefix)/share/antigen.zsh"
# shellcheck disable=SC1090
source "$(brew --prefix)/etc/profile.d/z.sh"

# Load the oh-my-zsh library
antigen use oh-my-zsh

# Load common bundles
antigen bundles <<EOBUNDLES
brew
brew-cask
bundler
capistrano
command-not-found
docker
docker
gem
git
node
npm
osx
ssh-agent
mafredri/zsh-async
sindresorhus/pure
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting
EOBUNDLES

antigen apply

export editor='ATOM'
export PATH="/usr/local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
# shellcheck disable=SC1090
source "$(brew --prefix nvm)/nvm.sh"

eval "$(rbenv init - --no-rehash)"
