#!/bin/bash

set -euo pipefail

function print_header() {
  echo "============================================="
  echo "$1"
  echo "============================================="
}

print_header "Install packages"
if [ ! -x /opt/homebrew/bin/brew ]; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install -y fish neovim
echo ""