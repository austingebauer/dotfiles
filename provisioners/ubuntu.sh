#!/bin/bash

# Generate a new ssh key for GitHub authentication
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

# Install Go tools
#go install github.com/go-delve/delve/cmd/dlv@latest
#go install honnef.co/go/tools/cmd/staticcheck@latest
#go install golang.org/x/tools/cmd/godoc@latest
#go install golang.org/x/tools/cmd/stress@latest
