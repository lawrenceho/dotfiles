# Ignore duplicates and lines beginning with a space in history
HISTCONTROL=ignoreboth

# Append history after each command
PROMPT_COMMAND="${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}history -a"

# Append history upon shell exit
shopt -s histappend

# Check window size after each external (non-builtin) command
shopt -s checkwinsize

# User specific environment
if [ -d "$HOME"/.local/bin ]; then
  export PATH="$HOME"/.local/bin:"$PATH"
fi

# GnuPG home
export GNUPGHOME="$HOME"/.local/share/gnupg

# Manage GnuPG and SSH agent with keychain
mkdir -p "$HOME"/.local/state/keychain
eval "$(keychain --agents gpg,ssh --dir "$HOME"/.local/state/keychain \
  --absolute --eval --quiet restic@localhost)"

# Password storage
export PASSWORD_STORE_DIR="$HOME"/.local/share/pass

# less options
export LESS='-iFRX'

# npm per-user configuration file
export NPM_CONFIG_USERCONFIG="$HOME"/.config/npm/npmrc

# Restic
. .config/restic/default-repo

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
