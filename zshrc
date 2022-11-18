#!/bin/zsh

eval "$(/opt/homebrew/bin/brew shellenv)"

path+=$HOME/.composer/vendor/bin
#autoload -U promptinit; promptinit
#prompt pure
eval "$(starship init zsh)"


source "$(brew --prefix)/share/antigen/antigen.zsh"
#source "$(brew --prefix asdf)/asdf.sh"
#source "$(brew --prefix asdf)/libexec/asdf.sh"
source "$(brew --prefix)/etc/profile.d/z.sh"

antigen use oh-my-zsh

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search

antigen apply

export EDITOR='nano'
export GPG_TTY=$(tty)
export DISABLE_SPRING=true

alias cat=bat
alias ls=exa
alias be='bundle exec'
alias rspec='be rspec'
alias rubocop='be rubocop'
alias rails='be rails'
alias sail='[ -f sail ] && bash sail || bash vendor/bin/sail'

. /opt/homebrew/opt/asdf/libexec/asdf.sh

# bun completions
[ -s "/Users/angusfretwell/.bun/_bun" ] && source "/Users/angusfretwell/.bun/_bun"

# Bun
export BUN_INSTALL="/Users/angusfretwell/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
