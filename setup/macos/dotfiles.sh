#!/usr/bin/env bash

set -euo pipefail

# ❌ Do not allow running as root
if [[ "$EUID" -eq 0 ]]; then
  echo "❌ Do NOT run this script as root."
  exit 1
fi

# Stowing Common  Dotfiles
stow -d common-dotfiles -t ~/ -v btop
stow -d common-dotfiles -t ~/ -v nvim
stow -d common-dotfiles -t ~/ -v themes
stow -d common-dotfiles -t ~/ -v vim

stow -d macos-dotfiles -t ~/ -v kitty
