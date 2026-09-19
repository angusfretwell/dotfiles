#!/usr/bin/env bash
set -euo pipefail

DEVBOX_USER="${DEVBOX_USER:-angus}"

if [[ $EUID -ne 0 ]]; then
	echo >&2 "run as root."
	exit 1
fi

if ! id "$DEVBOX_USER" &>/dev/null; then
	useradd --create-home --shell /bin/bash --groups sudo "$DEVBOX_USER"
fi

echo "$DEVBOX_USER ALL=(ALL) NOPASSWD:ALL" >"/etc/sudoers.d/$DEVBOX_USER"
chmod 440 "/etc/sudoers.d/$DEVBOX_USER"

ssh_dir="/home/$DEVBOX_USER/.ssh"
install -d -m 700 -o "$DEVBOX_USER" -g "$DEVBOX_USER" "$ssh_dir"
if [[ ! -s $ssh_dir/authorized_keys && -s /root/.ssh/authorized_keys ]]; then
	install -m 600 -o "$DEVBOX_USER" -g "$DEVBOX_USER" /root/.ssh/authorized_keys "$ssh_dir/authorized_keys"
fi
