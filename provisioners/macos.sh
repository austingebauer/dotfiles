#!/bin/bash

set -euo pipefail

function print_header() {
  echo "============================================="
  echo "$1"
  echo "============================================="
}

print_header "Install packages"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
brew install -y fish
echo ""
