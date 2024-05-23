# Ignore duplicates and lines beginning with a space in history
HISTCONTROL=ignoreboth

# Append history after each command
PROMPT_COMMAND='history -a'

# Append history upon shell exit
shopt -s histappend

# Check window size after each external (non-builtin) command
shopt -s checkwinsize

# Manage SSH agent with keychain
mkdir -p "$HOME"/.local/state/keychain
eval "$(keychain --agents ssh --dir "$HOME"/.local/state/keychain \
  --absolute --eval --quiet)"

# Add --git-dir and --work-tree options for dotfiles management when:
# 1. current directory is inside work tree, i.e. home directory
# 2. current directory is not within a git directory or work tree
git() {
  if command git --git-dir="$HOME"/.dotfiles --work-tree="$HOME" rev-parse \
    --is-inside-work-tree >/dev/null 2>&1 &&
    ! command git rev-parse --git-dir >/dev/null 2>&1; then
    set -- --git-dir="$HOME"/.dotfiles --work-tree="$HOME" "$@"
  fi
  command git "$@"
}

# Options for less
export LESS='-iFRX'

# Location for npm config
export NPM_CONFIG_USERCONFIG="$HOME"/.config/npm/npmrc

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
