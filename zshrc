#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

fpath+=$HOME/.zsh/pure
autoload -U promptinit; promptinit
prompt pure

source "$(brew --prefix)/share/antigen/antigen.zsh"
source "$(brew --prefix asdf)/asdf.sh"
source "$(brew --prefix)/etc/profile.d/z.sh"

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

export EDITOR='code'
export GPG_TTY=$(tty) 

alias cat=bat
alias ls=exa
