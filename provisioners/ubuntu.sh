#!/bin/bash

set -euo pipefail

function print_header() {
  echo "============================================="
  echo "$1"
  echo "============================================="
}

# Install or update standalone CLion and GoLand (Linux x86_64).
# Each version goes into its own clean directory under /opt, so nothing is ever
# extracted over an existing install. Re-running when you're current is a no-op.
# Usage: sudo ./install-jetbrains.sh
function install_jetbrains_ide() {
  local code=$1 name=$2 url file dir

  # The JetBrains "latest" link redirects to the versioned tarball;
  # follow it to find out which version that currently is.
  url=$(curl -fsIL -o /dev/null -w '%{url_effective}' \
    "https://download.jetbrains.com/product?code=$code&latest&distribution=linux")
  [ -n "$url" ] || { echo "Could not resolve download URL for $name" >&2; return 1; }

  file=${url##*/}             # CLion-2026.2.2.tar.gz
  dir=/opt/${file%%.tar.gz*}  # /opt/CLion-2026.2.2

  if [ -d "$dir" ]; then
    echo "$name is already up to date ($dir)"
  else
    echo "Installing $name to $dir"
    rm -rf "$dir.partial"
    mkdir -p "$dir.partial"
    if ! curl -fL "$url" | tar -xz -C "$dir.partial" --strip-components=1; then
      rm -rf "$dir.partial"
      echo "Failed to install $name" >&2
      return 1
    fi
    mv "$dir.partial" "$dir"
  fi

  sudo rm -f "/usr/local/bin/$name"
  sudo ln -s "$dir/bin/$name.sh" "/usr/local/bin/$name"
}

print_header "Install packages"
sudo apt update
sudo apt upgrade -y
sudo apt install -y git vim terminator curl gcc build-essential fish
echo ""

print_header "Install chrome"
if dpkg -s google-chrome-stable >/dev/null 2>&1; then
  echo "Chrome is already installed"
else
  deb=/tmp/google-chrome-stable_current_amd64.deb
  wget -O "$deb" https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo apt install -y "$deb"
  rm -f "$deb"
fi
echo ""

print_header "Install jetbrains"
install_jetbrains_ide CL clion
install_jetbrains_ide GO goland
echo ""

GO_VERSION=1.26.7
GO_DIR=$HOME/.local/bin/go
print_header "Install go$GO_VERSION"
if [ "$("$GO_DIR/bin/go" version 2>/dev/null | awk '{print $3}')" = "go$GO_VERSION" ]; then
  echo "go$GO_VERSION is already installed"
else
  tgz=/tmp/go$GO_VERSION.linux-amd64.tar.gz
  wget -O "$tgz" "https://go.dev/dl/go$GO_VERSION.linux-amd64.tar.gz"
  rm -rf "$GO_DIR"
  tar -C "$(dirname "$GO_DIR")" -xzf "$tgz"
  rm -f "$tgz"
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
