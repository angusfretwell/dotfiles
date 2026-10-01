#!/usr/bin/env bash
set -euo pipefail

WORKBOX_USER="${WORKBOX_USER:-angus}"

if [[ $EUID -ne 0 ]]; then
	echo >&2 "run as root."
	exit 1
fi

read -rp "Hostname [workbox]: " new_hostname
new_hostname="${new_hostname:-workbox}"
read -rsp "1Password service account token: " op_token
echo

sed -i -E "s/(\s)$(hostname)(\s|$)/\1$new_hostname\2/" /etc/hosts
hostnamectl set-hostname "$new_hostname"

if ! id "$WORKBOX_USER" &>/dev/null; then
	useradd --create-home --shell /bin/bash --groups sudo "$WORKBOX_USER"
fi

echo "$WORKBOX_USER ALL=(ALL) NOPASSWD:ALL" >"/etc/sudoers.d/$WORKBOX_USER"
chmod 440 "/etc/sudoers.d/$WORKBOX_USER"

home="/home/$WORKBOX_USER"
install -d -m 700 -o "$WORKBOX_USER" -g "$WORKBOX_USER" "$home/.ssh"
if [[ ! -s $home/.ssh/authorized_keys && -s /root/.ssh/authorized_keys ]]; then
	install -m 600 -o "$WORKBOX_USER" -g "$WORKBOX_USER" /root/.ssh/authorized_keys "$home/.ssh/authorized_keys"
fi

install -d -o "$WORKBOX_USER" -g "$WORKBOX_USER" "$home/.config"
install -d -m 700 -o "$WORKBOX_USER" -g "$WORKBOX_USER" "$home/.config/op"
printf '%s\n' "$op_token" |
	install -m 600 -o "$WORKBOX_USER" -g "$WORKBOX_USER" /dev/stdin "$home/.config/op/service-account-token"

loginctl enable-linger "$WORKBOX_USER"
su - "$WORKBOX_USER" -c 'export XDG_RUNTIME_DIR="/run/user/$(id -u)"; sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply angusfretwell/dotfiles'

/home/linuxbrew/.linuxbrew/bin/glow <<EOF
# Next steps

\`\`\`sh
sudo reboot

ssh $new_hostname # from laptop, once $new_hostname is back up

gh auth login

claude # sign in to claude code

t3_pair # pair t3 code at t3.wbox.dev
\`\`\`
EOF
