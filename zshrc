#!/usr/bin/env bash

# shellcheck disable=SC1090
source ~/.antigen.zsh

antigen bundle robbyrussell/oh-my-zsh lib/

antigen bundle mafredri/zsh-async
antigen bundle sindresorhus/pure

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-autosuggestions
antigen bundle zsh-history-substring-search
antigen bundle git
antigen bundle ssh-agent

antigen bundle node
antigen bundle npm

antigen bundle brew
antigen bundle brew-cask
antigen bundle gem
antigen bundle osx

export editor='ATOM'
