# dotfiles

Dotfiles for my macOS laptop and Ubuntu workbox, managed with [chezmoi](https://www.chezmoi.io).

## Install

### Laptop

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bootstrap/laptop.sh)"
```

### Workbox

From the laptop:

```bash
workbox_up
```

Before replacing a workbox, run this on the old one:

```bash
workbox_down
```

## Update

```bash
chezmoi update
```

## License

MIT
