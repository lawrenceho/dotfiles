# Ignore duplicates and lines beginning with a space
HISTCONTROL=ignoreboth

# Append history
shopt -s histappend

# Check window size after each external (non-builtin) command
shopt -s checkwinsize

# Manage SSH agent with keychain
mkdir -p "$HOME"/.local/state/keychain
eval "$(keychain --agents ssh --dir "$HOME"/.local/state/keychain --absolute --eval --quiet)"

# Enable dotfiles management with custom function
git() {
  if [ "$PWD" = "$HOME" ]; then
    command git --git-dir="$HOME"/.dotfiles --work-tree="$HOME" "$@"
  else
    command git "$@"
  fi
}

# Options for less
export LESS='-iFRX'

# Location for npm config
export NPM_CONFIG_USERCONFIG="$HOME"/.config/npm/npmrc

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
