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

yay -S --needed --noconfirm noctalia-shell cliphist wlsunset ddcutil
