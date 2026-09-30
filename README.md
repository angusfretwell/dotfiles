# dotfiles

Dotfiles for my macOS laptop and Ubuntu workbox, managed with [chezmoi](https://www.chezmoi.io).

## Install

### Laptop

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply angusfretwell/dotfiles
```

### Workbox

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bootstrap/workbox.sh)"
```

## Update

```bash
chezmoi update
```

## License

MIT
