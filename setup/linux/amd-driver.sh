#!/usr/bin/env bash

set -euo pipefail

# ❌ Do not allow running as root
if [[ "$EUID" -eq 0 ]]; then
  echo "❌ Do NOT run this script as root."
  exit 1
fi

yay -S --needed --noconfirm \
  amd-ucode \
  mesa lib32-mesa \
  vulkan-radeon lib32-vulkan-radeon \
  vulkan-tools \
  libva-mesa-driver \
  linux-firmware
