# List-Coder-CLI Releases

This repository hosts the release assets for [ListCoderCLi](https://list-coder.com/coder), a terminal-native AI coding assistant.

## What's here

- `List-Coder-CLI-Setup-<version>.exe` â€” official Windows installer (NSIS, per-user, no admin required)
- `install.sh` â€” Linux/macOS installer
- `listcoder-x86_64-unknown-linux-gnu` â€” Linux binary
- `.deb` / `.rpm` packages, Homebrew formula, AUR PKGBUILD
- `v<version>` tags pointing to each published release

## Install

### Windows (installer)

Download the latest `List-Coder-CLI-Setup-*.exe` from the [releases page](https://github.com/legitey01/List-Coder-CLI-Realeses/releases/latest) and run it. It installs to `%LOCALAPPDATA%\ListCoder`, adds itself to the user PATH and creates Start Menu / Desktop shortcuts.

### Windows (PowerShell one-liner)

```powershell
powershell -ep Bypass -c "irm https://raw.githubusercontent.com/legitey01/List-Coder-CLI/main/install.ps1 | iex"
```

### Linux / macOS (curl)

```bash
curl -fsSL https://raw.githubusercontent.com/legitey01/List-Coder-CLI-Realeses/main/install.sh | bash
```

### Linux (package managers)

```bash
# Debian / Ubuntu
curl -fsSL -o /tmp/listcoder.deb https://github.com/legitey01/List-Coder-CLI-Realeses/releases/latest/download/listcoder_0.1.4_amd64.deb
sudo dpkg -i /tmp/listcoder.deb

# Fedora / RHEL
curl -fsSL -o /tmp/listcoder.rpm https://github.com/legitey01/List-Coder-CLI-Realeses/releases/latest/download/listcoder-0.1.4-1.x86_64.rpm
sudo dnf install /tmp/listcoder.rpm
```

## Then

```bash
listcoder
```

The first launch guides you through configuration: List Coder Auto (free for a limited time), List Coder Platform OAuth login, Codex, or any custom OpenAI-compatible provider.

## Build

Releases are cut from the [List-Coder-CLI](https://github.com/legitey01/List-Coder-CLI) repository via its `publish` workflow (GitHub Actions) or manually with `bun script/release.ts`.