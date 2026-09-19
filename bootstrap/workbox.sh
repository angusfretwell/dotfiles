#!/usr/bin/env bash
set -euo pipefail

WORKBOX_USER="${WORKBOX_USER:-angus}"

if [[ $EUID -ne 0 ]]; then
	echo >&2 "run as root."
	exit 1
fi

if ! id "$WORKBOX_USER" &>/dev/null; then
	useradd --create-home --shell /bin/bash --groups sudo "$WORKBOX_USER"
fi

echo "$WORKBOX_USER ALL=(ALL) NOPASSWD:ALL" >"/etc/sudoers.d/$WORKBOX_USER"
chmod 440 "/etc/sudoers.d/$WORKBOX_USER"

ssh_dir="/home/$WORKBOX_USER/.ssh"
install -d -m 700 -o "$WORKBOX_USER" -g "$WORKBOX_USER" "$ssh_dir"
if [[ ! -s $ssh_dir/authorized_keys && -s /root/.ssh/authorized_keys ]]; then
	install -m 600 -o "$WORKBOX_USER" -g "$WORKBOX_USER" /root/.ssh/authorized_keys "$ssh_dir/authorized_keys"
fi
