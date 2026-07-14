#!/bin/bash

set -euo pipefail

function print_header() {
  echo "============================================="
  echo "$1"
  echo "============================================="
}

print_header "Install packages"
sudo apt update
sudo apt upgrade -y
sudo apt install -y git neovim terminator alacritty curl build-essential
rm /tmp/google-chrome-stable_current_amd64.deb
wget -P /tmp https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install /tmp/google-chrome-stable_current_amd64.deb
echo ""

print_header "Download font"
if [ ! -d "$HOME/.local/share/fonts" ]; then
    mkdir -p ~/.local/share/fonts
    wget https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip
    unzip JetBrainsMono.zip -d ~/.local/share/fonts/JetBrainsMono
    rm JetBrainsMono.zip
    fc-cache -fv
else
    echo "Fonts already downloaded"
fi
echo ""

print_header "Set peripherals settings"
gsettings set org.gnome.desktop.peripherals.keyboard repeat-interval 20
gsettings get org.gnome.desktop.peripherals.keyboard repeat-interval
gsettings set org.gnome.desktop.peripherals.keyboard delay 200
gsettings get org.gnome.desktop.peripherals.keyboard delay
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings get org.gnome.shell.extensions.dash-to-dock dock-position
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings get org.gnome.shell.extensions.dash-to-dock extend-height
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings get org.gnome.shell.extensions.dash-to-dock dock-fixed
echo ""

print_header "Generate ssh key for GitHub authentication"
KEY_PATH="$HOME/.ssh/github_id_ed25519"
mkdir -p "$HOME/.ssh"
chmod 700 "$HOME/.ssh"
if [ ! -f "$KEY_PATH" ]; then
  echo "Key not found. Generating ED25519 SSH key..."
  ssh-keygen -t ed25519 -C "gebauer.austin@gmail.com" -f "$KEY_PATH" -N "" -q
  chmod 600 "$KEY_PATH"
  chmod 644 "${KEY_PATH}.pub"

  echo "SSH key successfully generated."
else
  echo "SSH key already exists at $KEY_PATH. Skipping generation."
fi
echo "ACTION: add public key to GitHub \"$(cat ${KEY_PATH}.pub)\""
echo ""
