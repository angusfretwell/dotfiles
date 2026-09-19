# ~/.dotfiles

## Usage

### Laptop

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- init --apply angusfretwell/dotfiles
```

### Devbox

```bash
curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/bootstrap/devbox.sh | bash
```

Then log in as `angus` (`ssh angus@<host>` or `su - angus`):

```bash
sh -c "$(curl -fsLS https://get.chezmoi.io)" -- -b "$HOME/.local/bin" init --apply angusfretwell/dotfiles
```

## License

MIT
