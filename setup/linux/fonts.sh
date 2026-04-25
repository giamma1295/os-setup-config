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

yay -S --needed --noconfirm gsfonts ttf-ia-writer ttf-arimo-nerd ttf-cascadia-mono-nerd ttf-jetbrains-mono-nerd ttf-liberation ttf-liberation-mono-nerd ttf-meslo-nerd otf-font-awesome noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra woff2-font-awesome
