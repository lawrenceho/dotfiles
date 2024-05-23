# Ignore duplicates and lines beginning with a space
HISTCONTROL=ignoreboth

# Append history
shopt -s histappend

# Check window size after each external (non-builtin) command
shopt -s checkwinsize

# Manage SSH agent with keychain
eval "$(keychain --agents ssh --dir "$HOME"/.local/state/keychain --absolute --eval --quiet)"

# Alias for dotfiles management
alias config='git --git-dir="$HOME"/.dotfiles --work-tree="$HOME"'

# Options for less
export LESS='-iFRX'

# Location for npm config
export NPM_CONFIG_USERCONFIG="$HOME"/.config/npm/npmrc

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
