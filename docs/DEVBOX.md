# Devbox

On a fresh Debian or Ubuntu server named `devbox`, as root:

```bash
curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bootstrap/devbox.sh | bash
```

Then, as `angus`:

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply angusfretwell/dotfiles
```
