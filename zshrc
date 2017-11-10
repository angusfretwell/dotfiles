#!/usr/bin/env bash

export EDITOR='nano'
export PATH="/usr/local/bin:$HOME/.bin:$PATH"

# shellcheck disable=SC1090
source <(antibody init)
# shellcheck disable=SC1090
source "$(brew --prefix asdf)/asdf.sh"
# shellcheck disable=SC1090
source "$(brew --prefix)/etc/profile.d/z.sh"

# Load common bundles
antibody bundle <<EOBUNDLES
mafredri/zsh-async
sindresorhus/pure
zsh-users/zsh-completions
zsh-users/zsh-autosuggestions
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting
EOBUNDLES
