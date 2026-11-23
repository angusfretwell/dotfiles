# dotfiles

Dotfiles and machine setup for my macOS laptop and Ubuntu workbox, managed with [mise](https://mise.jdx.dev) (`mise bootstrap`).

## Layout

The repository root is mise's config directory. Bootstrap links it as `~/.config/mise`.

- `config.toml` declares the tools.
- `conf.d/` declares the rest, one folder per topic:
  - `packages` for Homebrew, casks and App Store apps.
  - `dotfiles` has one folder per app. Its `mise.toml` maps each one to its place under `$HOME`.
  - `macos` loads on macOS.
  - `workbox` is the workbox [module](https://mise.jdx.dev/bootstrap/modules.html). A machine loads it when `miserc.local.toml` has `env = ["workbox"]`, which `scripts/setup-workbox` saves on its first run.
- `tasks/` and each module's own `tasks/` hold the scripts bootstrap runs last.
- `bin/` is linked into `~/.local/bin`.
- `scripts/bootstrap` runs `mise bootstrap` with secrets from 1Password via [fnox](https://fnox.jdx.dev).
- `scripts/setup-laptop` and `scripts/setup-workbox` set up a fresh machine.

Always apply from the checkout at `~/.dotfiles`, never from a worktree: dotfiles are symlinks into the checkout.

## Install

### Laptop

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/angusfretwell/dotfiles/main/scripts/setup-laptop)"
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
~/.dotfiles/scripts/bootstrap --update
```

`--update` fast-forwards the checkout first. Drop it to apply local changes. Preview with `--dry-run`.

Bootstrap installs what is declared and never upgrades or removes anything. To upgrade or clean up packages:

```bash
mise bootstrap packages upgrade
mise bootstrap packages prune --dry-run
mise bootstrap packages prune
```

Deleting a package from `conf.d/packages` does not uninstall it until `prune` runs.

## Secrets

`scripts/bootstrap` reads the 1Password service account token from `~/.config/op/service-account-token` when it exists (the workbox). Otherwise `op` uses the 1Password desktop app. Secrets are declared in `conf.d/dotfiles/fnox/config.toml`. Each module's secrets go in the fnox profile of the same name. One-off logins (Atuin, Tailscale, Samba) read from 1Password with `op read` only when needed.

## License

MIT
