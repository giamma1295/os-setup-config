#!/usr/bin/env bash

set -euo pipefail

# ❌ Do not allow running as root
if [[ "$EUID" -eq 0 ]]; then
  echo "❌ Do NOT run this script as root."
  exit 1
fi

# Base
sh ./setup/linux/amd-driver.sh
sh ./setup/linux/arch-base-postinstall.sh
sh ./setup/linux/fonts.sh
sh ./setup/linux/dotfiles.sh

# WM e Shell
sh ./setup/linux/niri.sh
sh ./setup/linux/noctalia.sh

# Laptopt specific
sh ./setup/linux/tlp.sh

# Development
sh ./setup/linux/arch-development.sh
