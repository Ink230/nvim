# Restore Justin's Neovim setup

This repository is the authoritative configuration from Justin's Windows PC, reconciled on 2026-11-07. Read README.md before restoring.

- Install Neovim separately through Scoop on Windows
- Use Neovim 0.12 or newer because this setup uses vim.pack.add
- Back up the existing configuration before cloning into the config directory
- On Windows the default config directory is %LOCALAPPDATA%\nvim
- On Windows %LOCALAPPDATA%\nvim-data is generated plugin storage and runtime state
- Preserve nvim-pack-lock.json so vim.pack installs the saved plugin revisions
- Launch interactively once to allow plugin installation and handle any prompts
- Do not copy swap files, shada, logs, or telescope history from another PC
- Custom colors are in lua/ink/plugin-config/colors.lua
- Plugin working trees had no tracked changes at capture time; the only untracked plugin file was a generated doc/tags
- All 2133 installed Neovim files matched Scoop's cached 0.12.4 installer archive
- Do not patch the installed Neovim runtime to restore this setup
- See README.md for language-server executables and the existing Angular LSP naming mismatch
