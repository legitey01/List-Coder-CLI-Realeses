# List-Coder-CLI Releases

This repository hosts the release assets for [List Coder CLI](https://list-coder.com/coder), a terminal-native AI coding assistant.

## What's here

- `List-Coder-CLI-Setup-<version>.exe` — official Windows installer (NSIS, per-user, no admin required)
- `v<version>` tags pointing to each published release

## Install

### Windows (installer)

Download the latest `List-Coder-CLI-Setup-*.exe` from the [releases page](https://github.com/legitee01/List-Coder-CLI-Realeses/releases/latest) and run it. It installs to `%LOCALAPPDATA%\ListCoder`, adds itself to the user PATH and creates Start Menu / Desktop shortcuts.

### Windows (PowerShell one-liner)

```powershell
powershell -ep Bypass -c "irm https://github.com/legitee01/List-Coder-CLI/releases/download/MakeAutoRelease/install.ps1 | iex"
```

### macOS / Linux

```bash
curl -fsSL https://list-coder.com/install | bash
```

## Then

```bash
listcoder
```

The first launch guides you through configuration: List Coder Auto (free for a limited time), List Coder Platform OAuth login, Codex, or any custom OpenAI-compatible provider.

## Build

Releases are cut from the [List-Coder-CLI](https://github.com/legitee01/List-Coder-CLI) repository via its `publish` workflow (GitHub Actions) or manually with `bun script/release.ts`.