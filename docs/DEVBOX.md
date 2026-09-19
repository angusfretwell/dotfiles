# Devbox

On a fresh Debian or Ubuntu server named `devbox`, as root:

```bash
curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bootstrap/devbox.sh | bash
```

As `angus`:

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply angusfretwell/dotfiles
```

Reconnect with `ssh devbox`, then:

```bash
gh auth login --git-protocol ssh
```

```bash
claude
```
