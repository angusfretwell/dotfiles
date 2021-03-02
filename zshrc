#!/usr/bin/env bash

export EDITOR='nano'

export PATH="/usr/local/bin:$PATH"
export PATH="/usr/local/sbin:$PATH"
export PATH="$HOME/.dotfiles/bin:$PATH"
export PATH="$HOME/Sites/hooroo/extranet-scripts$PATH"


# shellcheck disable=SC1090
source "$(brew --prefix)/share/antigen/antigen.zsh"
# shellcheck disable=SC1090
source "$(brew --prefix asdf)/asdf.sh"
# shellcheck disable=SC1090
source "$(brew --prefix)/etc/profile.d/z.sh"

antigen use oh-my-zsh

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply
