abbr -a gco "git checkout"
abbr -a gcb "git checkout -b"
abbr -a gst "git status"
abbr -a grs "git restore"
abbr -a grst "git restore --staged"
abbr -a ggpush "git push origin (git branch --show-current)"
abbr -a ggpull "git pull origin (git branch --show-current)"
abbr -a gfo "git fetch origin"
abbr -a gb "git branch --show-current"
abbr -a gba "git branch"
abbr -a gd "git diff"
abbr -a glg "git log --stat"
abbr -a gaa "git add --all"
abbr -a gcmsg "git commit --message"
abbr -a tf "terraform"
if command -q nvim
    abbr -a vim nvim
    set -gx EDITOR nvim
end

set -gx fish_greeting ""

fish_add_path /opt/homebrew/bin /opt/homebrew/sbin
fish_add_path $HOME/.local/bin/go/bin
if command -q go
    fish_add_path (go env GOPATH)/bin
end
