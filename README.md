# dotfiles

My dotfiles and setup scripts for linux and macOS.

## Setup

1. Clone this repo.
2. Install packages:
   - Ubuntu: `./provisioners/ubuntu.sh`
   - macOS: `./provisioners/macos.sh`
3. Copy the dotfiles into your home directory:
   ```bash
   ./sync.sh      # asks before overwriting
   ./sync.sh -f   # no prompt
   ```
4. Open a new terminal.

## Shell

The login shell stays the system default (bash on Ubuntu, zsh on macOS), and
`.bashrc` / `.zshrc` hand interactive sessions over to fish. Typing `bash` or
`zsh` from fish still gives you that shell. Shell config lives in
`.config/fish/config.fish`.

## Purpose of files

| File | Purpose |
| --- | --- |
| `.config/fish/config.fish` | fish config: git abbreviations, `PATH`, editor |
| `.bashrc`, `.bash_profile`, `.zshrc` | Start fish from bash or zsh |
| `.vimrc`, `.ideavimrc` | Vim and IdeaVim settings |
| `.gitconfig`, `.gitignore_global` | Git settings and global ignores |
| `provisioners/` | Install scripts for Ubuntu and macOS |
| `sync.sh` | Copies the dotfiles into `~` |
