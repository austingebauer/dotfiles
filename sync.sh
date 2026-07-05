#!/usr/bin/env bash

function sync_dotfiles() {
	rsync --exclude ".git/" \
		--exclude ".gitignore" \
		--exclude ".DS_Store" \
		--exclude "sync.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --perms . ~
	echo "Sync complete!"
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	sync_dotfiles
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n): " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		sync_dotfiles
	fi
fi
