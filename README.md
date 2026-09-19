# ~/.dotfiles

## Usage

### Laptop

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply angusfretwell/dotfiles
```

### Devbox

```bash
curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bootstrap/devbox.sh | bash
```

Then as `angus`:

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply angusfretwell/dotfiles
```

## License

MIT
