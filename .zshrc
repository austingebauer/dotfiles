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
# bindkey '\t' autosuggest-accept

# HCP
# used by internal tooling, requires authentication via the GitHub cli
echo 'export GITHUB_TOKEN="$(gh config get -h github.com oauth_token)"' >> ${ZDOTDIR:-~}/.zshrc
# used by Homebrew to access private assets
echo 'export HOMEBREW_GITHUB_API_TOKEN="${GITHUB_TOKEN}"' >> ${ZDOTDIR:-~}/.zshrc
# hcloud autocomplete
if which hcloud > /dev/null; then
  complete -C $(which hcloud) hcloud
fi
# direnv for roam
eval "$(direnv hook zsh)"

# Vault
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C $HOME/go/bin/vault vault

# Terraform
mkdir -p ~/.terraform.d/plugins

# Kubernetes
source <(kubectl completion zsh)
complete -F __start_kubectl kb

# gcloud
if [ -f "$HOME/Workspace/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Workspace/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/Workspace/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Workspace/google-cloud-sdk/completion.zsh.inc"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/Workspace/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/Workspace/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/Workspace/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/Workspace/google-cloud-sdk/completion.zsh.inc"; fi
