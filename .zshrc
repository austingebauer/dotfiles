eval "$(/opt/homebrew/bin/brew shellenv)"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set theme: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Time stamp shown in the history command output.
HIST_STAMPS="mm/dd/yyyy"

# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Disabled for now: zsh-autosuggestions
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Installed from the homebrew package. This can also be 
# installed via an oh-my-zsh plugin as noted above.
source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Load the shell dotfiles:
for file in ~/.{exports,path,functions,aliases,ignore}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Keybindings
bindkey "^U" backward-kill-line

# Terraform
mkdir -p ~/.terraform.d/plugins
