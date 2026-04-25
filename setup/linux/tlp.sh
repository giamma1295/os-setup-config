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

# Install TLP
yay -S --needed --noconfirm ethtool tlp tlpui tlp-pd tlp-rdw smartmontools

# Enable TLP
sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket
sudo systemctl enable tlp
