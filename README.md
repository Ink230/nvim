# Restore Justin's Neovim setup

This repository contains the authoritative Windows configuration captured on 2026-11-07. Install Neovim separately. You need this repository to restore the setup; you do not need to copy the source PC's `nvim-data` directory.

Ask an agent:

> Restore my Neovim setup from Ink230/nvim. Read AGENTS.md and README.md, back up my existing config, install Neovim through Scoop, and restore the pinned plugins.

## Restore on Windows

1. Install Neovim and Git through Scoop

```powershell
scoop install neovim git
```

Use Neovim 0.12 or newer. The original installation was 0.12.4. This configuration uses the built-in `vim.pack` package manager.

2. Close Neovim and back up any existing configuration

```powershell
$configPath = Join-Path $env:LOCALAPPDATA 'nvim'
if (Test-Path -LiteralPath $configPath) {
	Move-Item -LiteralPath $configPath -Destination ($configPath + '.backup-' + [guid]::NewGuid().ToString('N'))
}
git clone https://github.com/Ink230/nvim.git $configPath
```

3. Start `nvim` interactively and allow the declared plugins to install
4. Run `:checkhealth` and verify the theme and keybindings

`nvim-pack-lock.json` records the seven plugin revisions. Keep it when cloning. The plugin declarations in `lua/ink/plugin-setup/init.lua` use `vim.pack.add`, which creates plugin storage under Neovim's data directory. Internet access and Git are required for that first installation.

If environment variables such as `NVIM_APPNAME` or XDG directory overrides are set, confirm the actual paths with `:echo stdpath('config')` and `:echo stdpath('data')` before restoring. See [Neovim's standard paths](https://neovim.io/doc/user/starting/#standard-path) and [package management](https://neovim.io/doc/user/pack/).

## What each folder contains

| Location on the source PC | Purpose | Restore source |
| --- | --- | --- |
| `%LOCALAPPDATA%\nvim` | init.lua, keybindings, colors, options, language-server definitions, and plugin declarations and lockfile | This repository |
| `%LOCALAPPDATA%\nvim-data` | Downloaded plugins, generated help tags, swap files, shada, logs, and history | Neovim recreates these; vim.pack installs plugins |
| `%USERPROFILE%\scoop\apps\neovim` | Neovim executable and bundled runtime files | Scoop installation |

All seven installed plugin working trees were checked. None had tracked modifications; only nightvision-nvim's generated `doc/tags` was untracked. All 2,133 installed Neovim files matched the cached Scoop 0.12.4 installer archive. No runtime patch needs to be copied. The custom colors are Lua highlight definitions in `lua/ink/plugin-config/colors.lua`.

## External tools and existing limitations

Install `ripgrep` for Telescope's grep operation. The saved language-server definitions call these executables on PATH:

- `ngserver` for Angular
- `clangd` for C
- `csharp-ls` for C#
- `typescript-language-server` for JavaScript and TypeScript

These tools are separate installations and are not bundled in this repository. Their versions were not captured. The current configuration enables `angularls`, but its file is named `lsp/angular_ls.lua`. This is an existing naming mismatch, so Angular LSP needs a separate correction before it can work. The C# root markers also use literal `.sln` and `.csproj` names; check language-server root detection on the target project. This backup preserves the local settings.

## How the remote was reconciled

The local checkout started at `47f3da6`. GitHub had one additional commit, `8721e5a`, with a WSL clipboard override and a case correction for `scrollEOF.lua`. The reconciliation keeps both commits in history, uses the local configuration as authoritative, and keeps the filename capitalization that matches `require("ink.plugin-config.scrollEOF")`. The remote-only WSL clipboard override is absent from this Windows setup. Configure a WSL clipboard provider separately when restoring under WSL.

Logs are excluded from tracking. The pre-existing local log files remain on the source PC. The portable configuration and pinned plugin installation were checked with an isolated data directory; destination-PC language-server behavior still needs verification.
