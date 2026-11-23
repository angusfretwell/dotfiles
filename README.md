# dotfiles

Dotfiles and machine setup for my macOS laptop and Ubuntu workbox, managed with [mise](https://mise.jdx.dev).

## Install

### Laptop

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bin/setup-laptop)"
```

### Workbox

From the laptop:

```bash
workbox-up
```

Before replacing a workbox, run this on the old one:

```bash
workbox-down
```

## Update

```bash
dot-update
```

To also upgrade installed packages and tools, and uninstall packages nothing declares any more:

```bash
dot-upgrade
```

## License

MIT
