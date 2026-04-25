#!/usr/bin/env bash

set -euo pipefail

# ------------------------------
#       INITIAL CHECKS
# ------------------------------

# ❌ Do not allow running as root
if [[ "$EUID" -eq 0 ]]; then
  echo "❌ Do NOT run this script as root."
  exit 1
fi
# Install Hyprland
yay -S --needed --noconfirm hyprland kitty hyprshot uwsm

# Install additional packages
yay -S --needed --noconfirm brightnessctl xdg-desktop-portal-hyprland xdg-desktop-portal-gtk hyprpolkitagent
