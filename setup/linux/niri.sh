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

# Install Niri + essential packages
yay -S --needed --noconfirm \
  niri kitty alacritty matugen cava qt6-multimedia-ffmpeg

# Install Wayland essentials
yay -S --needed --noconfirm \
  brightnessctl wl-clipboard \
  xdg-desktop-portal-gtk xdg-desktop-portal-gnome

# Install Polkit agent
yay -S --needed --noconfirm polkit-gnome

# Optional: Install X11 support for Flatpak apps if needed
yay -S --needed --noconfirm xwayland-satellite

# Install gnome-keyring for Secret portal
yay -S --needed --noconfirm gnome-keyring
