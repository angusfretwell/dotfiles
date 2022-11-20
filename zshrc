#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

source "$(brew --prefix)/share/antigen/antigen.zsh"
source "$(brew --prefix asdf)/libexec/asdf.sh"

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

eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
