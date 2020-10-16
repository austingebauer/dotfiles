# Path to your oh-my-zsh installation.
export ZSH="/Users/austingebauer/.oh-my-zsh"

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

# Load the shell dotfiles:
for file in ~/.{path,exports,functions,aliases,ignore}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

# Keybindings
bindkey "^U" backward-kill-line
# bindkey '\t' autosuggest-accept

# Vault
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /Users/austingebauer/go/bin/vault vault

# Terraform
mkdir -p ~/.terraform.d/plugins

# Kubernetes
source <(kubectl completion zsh)
complete -F __start_kubectl kb

# gcloud
if [ -f '/Users/austingebauer/Workspace/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/austingebauer/Workspace/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/austingebauer/Workspace/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/austingebauer/Workspace/google-cloud-sdk/completion.zsh.inc'; fi
