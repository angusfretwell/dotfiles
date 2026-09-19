# Devbox

A devbox is a disposable Linux server for agents and interactive work. This repo rebuilds it from scratch, so anything not pushed to git is lost on rebuild. You reach it over Tailscale only, with mosh landing in herdr.

It needs a Debian or Ubuntu server that you can reach as root over SSH with your key. Name it `devbox`.

## 1. Create your user

As root:

```bash
curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bootstrap/devbox.sh | bash
```

This creates `angus` with passwordless sudo and root's SSH keys. Set `DEVBOX_USER` to use another name. Skip this step if your provider already created a user with sudo.

## 2. Apply the dotfiles

As your user:

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply angusfretwell/dotfiles
```

On Linux, chezmoi also sets up the system:

- It installs system packages, sets the locale and turns on unattended security upgrades, without automatic reboots.
- It makes zsh your login shell and keeps your user services running after you log out.
- It turns off password and root SSH logins.
- It installs Docker. Containers publish ports on `127.0.0.1` unless a Compose file names another address.
- It installs Tailscale and asks you to log in, then turns on ufw so inbound traffic comes only through `tailscale0` and the Tailscale WireGuard port.

Log in again over Tailscale (`ssh devbox`) to pick up zsh and the `docker` group. Then give the box its own GitHub identity and sign in to Claude:

```bash
gh auth login --git-protocol ssh
```

```bash
claude
```

`gh auth login` offers to create an SSH key and upload it to GitHub. The box never uses your laptop's keys.

## 3. Close public access

ufw already blocks everything but Tailscale. If your provider has a network firewall too, allow only UDP 41641 inbound. If that firewall is stateless, such as Hetzner's Robot firewall, also allow replies to the box's own connections: TCP 32768-65535 with the ACK flag, and UDP 32768-65535. Keep your provider's rescue or console access in mind in case you lock yourself out.

## Daily use

On the laptop, `devbox` runs `mosh devbox -- herdr`, which attaches to the herdr session on the box. Agents keep running after you disconnect. Dev servers running on the host open at `http://devbox:<port>`. Container ports bind to `127.0.0.1`, so reach them with `tailscale serve`, which also gives you HTTPS. VS Code, Cursor and Zed remotes use plain SSH to `devbox`.

To rebuild, reinstall the OS and repeat these steps.
