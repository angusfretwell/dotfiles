# dotfiles

Dotfiles and machine setup for my macOS laptop and Ubuntu workbox, managed with [mise](https://mise.jdx.dev) (`mise bootstrap`).

## Layout

The repository root is mise's config directory. Bootstrap links it as `~/.config/mise`.

- `config.toml` declares the tools and links `bin/` into `~/.local/bin`.
- `conf.d/` declares the rest, one folder per topic, such as `git`, `samba` or `cursor`. A folder holds everything for its topic:
  - `mise.toml` loads on both machines, `mise.laptop.toml` on the laptop and `mise.workbox.toml` on the workbox.
  - `tasks/shared`, `tasks/laptop` and `tasks/workbox` hold the scripts bootstrap runs last on those machines.
  - The dotfiles and other files its config deploys sit beside it.
- `conf.d/homebrew` has the formulae, casks and App Store apps that no other topic owns.
- `conf.d/macos` has the macOS preferences. It loads on macOS.
- A machine is the laptop or the workbox when `miserc.local.toml` has `env = ["laptop"]` or `env = ["workbox"]`. `scripts/setup-laptop` and `scripts/setup-workbox` save that on their first run.
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

Deleting a package from `conf.d` does not uninstall it until `prune` runs.

## Secrets

`scripts/bootstrap` reads the 1Password service account token from `~/.config/op/service-account-token` when it exists (the workbox). Otherwise `op` uses the 1Password desktop app. Secrets are declared in `conf.d/fnox/config.toml`. Secrets only one machine needs go in the fnox profile named after it, `laptop` or `workbox`. One-off logins (Atuin, Tailscale, Samba) read from 1Password with `op read` only when needed.

## License

MIT
