#!/usr/bin/env bash

# shellcheck disable=SC1090
source <(antibody init)

antibody bundle mafredri/zsh-async
antibody bundle sindresorhus/pure
