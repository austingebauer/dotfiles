if [[ -z $INTELLIJ_ENVIRONMENT_READER && -x /opt/homebrew/bin/fish && $(ps -o comm= -p $PPID) != *fish* ]]; then
    exec /opt/homebrew/bin/fish
fi
