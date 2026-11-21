# dotfiles

Dotfiles and machine setup for my macOS laptop and Ubuntu workbox, managed with [mise](https://mise.jdx.dev) (`mise bootstrap`).

## Layout

The repository root is mise's config directory. Bootstrap links it as `~/.config/mise`.

- `config.toml` declares the tools.
- `conf.d/` declares the rest, one folder per topic:
  - `packages` for Homebrew, casks and App Store apps.
  - `dotfiles` maps each folder in `dotfiles/` to its place under `$HOME`.
  - `macos` and `macos-defaults` load on macOS.
  - `workbox` is the workbox [module](https://mise.jdx.dev/bootstrap/modules.html). A machine loads it when `miserc.local.toml` has `env = ["workbox"]`, which `bin/setup-workbox` saves on its first run.
- `tasks/` and each module's own `tasks/` hold the scripts bootstrap runs last.
- `dotfiles/` has one folder per app.
- `scripts/` is linked into `~/.local/bin`.
- `bin/bootstrap` runs `mise bootstrap` with secrets from 1Password via [fnox](https://fnox.jdx.dev).
- `bin/setup-laptop` and `bin/setup-workbox` set up a fresh machine.

Always apply from the checkout at `~/.dotfiles`, never from a worktree: dotfiles are symlinks into the checkout.

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
~/.dotfiles/bin/bootstrap --update
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

`bin/bootstrap` reads the 1Password service account token from `~/.config/op/service-account-token` when it exists (the workbox). Otherwise `op` uses the 1Password desktop app. Secrets are declared in `dotfiles/fnox/config.toml`. Each module's secrets go in the fnox profile of the same name. One-off logins (Atuin, Tailscale, Samba) read from 1Password with `op read` only when needed.

## Migrating an existing machine from chezmoi

1. Move the checkout to `~/.dotfiles` and update it to `main`: `mv ~/.local/share/chezmoi ~/.dotfiles`.
2. Move any existing mise config aside so bootstrap can link `~/.config/mise` into the checkout: `mv ~/.config/mise ~/.config/mise.bak`. On the workbox, prefix the commands in step 3 with `MISE_ENV=workbox` and add `--save-env` to the second, which selects the module and records it for later runs.
3. Run `~/.dotfiles/bin/bootstrap --dry-run`, then `~/.dotfiles/bin/bootstrap`. Existing dotfiles that differ block the run; move them aside or use `--force-dotfiles`.
4. Run `mise bootstrap packages prune --dry-run` and review before pruning. The `chezmoi` formula is no longer declared.

Before step 3, remove what chezmoi set up under the old names. mise recreates them under `dev.mise.*`.

macOS:

```bash
launchctl bootout gui/$(id -u)/local.workbox-mount 2>/dev/null
rm -f ~/Library/LaunchAgents/local.workbox-mount.plist
```

Linux, from the console or an existing SSH session:

```bash
systemctl --user disable --now beszel-hub.service beszel-agent.service \
  cargo-sweep.timer docker-image-prune.timer worktree-prune.timer workbox-backup.timer
rm ~/.config/systemd/user/{beszel-hub,beszel-agent,cargo-sweep,docker-image-prune,worktree-prune,workbox-backup}.service \
  ~/.config/systemd/user/{cargo-sweep,docker-image-prune,worktree-prune,workbox-backup}.timer
rm -f ~/.local/bin/linux/beszel ~/.local/bin/linux/beszel-agent
rm -rf ~/.config/systemd/user/t3code-.scope.d ~/.config/systemd/user.conf.d
systemctl --user daemon-reload
sudo ufw reset
```

`ufw reset` disables the firewall until bootstrap re-enables it with its own rules. Bootstrap applies the firewall before `tailscale up`, so check `tailscale status` before rebooting.

## License

MIT
