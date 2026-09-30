#!/usr/bin/env bash
set -euo pipefail

read -rp "Hostname [laptop]: " new_hostname
new_hostname="${new_hostname:-laptop}"

sudo scutil --set HostName "$new_hostname"
sudo scutil --set LocalHostName "$new_hostname"

sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply angusfretwell/dotfiles
