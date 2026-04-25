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

stow -d linux-dotfiles -t ~/ -v electron
stow -d linux-dotfiles -t ~/ -v fontconfig
stow -d linux-dotfiles -t ~/ -v gtk-3.0
stow -d linux-dotfiles -t ~/ -v gtk-4.0
stow -d linux-dotfiles -t ~/ -v hyprland
stow -d linux-dotfiles -t ~/ -v kitty
stow -d linux-dotfiles -t ~/ -v niri
stow -d linux-dotfiles -t ~/ -v noctalia
