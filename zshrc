#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

source "$(brew --prefix)/share/antigen/antigen.zsh"
source "$(brew --prefix asdf)/libexec/asdf.sh"
source "$(brew --prefix)/etc/profile.d/z.sh"

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

export EDITOR='nano'
export GPG_TTY=$(tty)

alias cat=bat
alias ls=exa

eval "$(starship init zsh)"
