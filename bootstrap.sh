#!/usr/bin/env bash

function bootstrap() {
	rsync --exclude ".git/" \
		--exclude ".gitignore" \
		--exclude ".DS_Store" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE" \
		-avh --perms . ~
	echo "--- Done ---"
	echo "Run: \`pushd ~ && source .zshrc && popd\`"
	echo "Run: \`./.macos\`"
	echo "Run: \`./.brew\`"
	echo "Run: \`./.gotools\`"
}

if [ "$1" == "--force" ] || [ "$1" == "-f" ]; then
	bootstrap
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		bootstrap
	fi
fi
