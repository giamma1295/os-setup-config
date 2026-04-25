#!/usr/bin/env bash

set -euo pipefail

# ❌ Do not allow running as root
if [[ "$EUID" -eq 0 ]]; then
  echo "❌ Do NOT run this script as root."
  exit 1
fi

echo -e "\nInstalling yay!"

if command -v yay >/dev/null 2>&1; then
  echo -e "\n✅ yay is already installed"
  exit 0
fi

echo "⚠️ yay not found — installing..."

sudo pacman -Syu --needed --noconfirm base-devel git || exit 1

tmpdir=$(mktemp -d)
pushd "$tmpdir" >/dev/null || exit 1

git clone https://aur.archlinux.org/yay.git .
makepkg -si --noconfirm

popd >/dev/null
rm -rf "$tmpdir"

echo -e "\n✅ yay has been installed successfully!!!"

echo -e "\nInstalling base systems packages!"

# Base Packages
yay -S --needed --noconfirm acpi btop fd fzf flatpak fwupd gvim htop lf man nano openssh stow unzip usbutils wget xdg-terminal-exec xdg-user-dirs xdg-user-dirs-update xdg-utils zsh zram-generator

# Audio
yay -S --needed --noconfirm gst-plugin-pipewire libpulse pipewire pipewire-alsa pipewire-audio pipewire-jack pipewire-pulse wireplumber sof-firmware

# Display Manager
yay -S --needed --noconfirm ly
sudo systemctl enable ly@tty1.service
sudo systemctl disable getty@tty1.service
sudo systemctl disable getty@tty2.service
sudo systemctl disable getty@tty3.service
sudo systemctl disable getty@tty4.service
sudo systemctl disable getty@tty5.service
sudo systemctl disable getty@tty6.service

# Network
yay -S --needed --noconfirm networkmanager nm-connection-editor nss-mdns wireless_tools wpa_supplicant
sudo systemctl enable NetworkManager

# Bluetooth
yay -S --needed --noconfirm bluez bluez-utils
sudo systemctl enable bluetooth

# Filesystem Utility
yay -S --needed --noconfirm btrfs-progs btrfs-assistant snapper snapper-support

# Wayland Utils
yay -S --needed --noconfirm egl-wayland qt5-wayland qt6-wayland xwayland

# Flatpak
yay -S flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Additional Packages
yay -S --needed --noconfirm bitwarden evince fastfetch gnome-calculator gnome-keyring gnome-themes-extra gparted grim gvfs-mtp gvfs-nfs gvfs-smb imv nautilus proton-vpn-gtk-app slurp telegram-desktop vlc vlc-plugins-all yt-dlp helium-browser-bin localsend ookla-speedtest-bin pantum-universal-driver zen-browser-bin
