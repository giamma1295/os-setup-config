#!/usr/bin/env bash

set -euo pipefail

# ❌ Do not allow running as root
if [[ "$EUID" -eq 0 ]]; then
  echo "❌ Do NOT run this script as root."
  exit 1
fi

yay -S --needed --noconfirm fd fzf github-cli jdk-openjdk lazygit lf luarocks nodenv nodenv-node-build nvim python-pip ripgrep
