# dotfiles

Dotfiles for my macOS laptop and Ubuntu devbox, managed with [chezmoi](https://www.chezmoi.io).

## Install

### Laptop

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply angusfretwell/dotfiles
```

### Devbox

As root, create the `angus` user with passwordless sudo and root's SSH keys:

```bash
curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bootstrap/devbox.sh | bash
```

Log in as `angus` (`ssh angus@<host>` or `su - angus`) and apply the dotfiles:

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply angusfretwell/dotfiles
```

It asks you to log in to Tailscale, then blocks incoming connections from outside your tailnet. Reconnect over Tailscale to get zsh and the `docker` group.

## Update

```bash
chezmoi update
```

## License

MIT
