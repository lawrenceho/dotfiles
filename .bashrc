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

# Default editor
export EDITOR='nvim'

# fzf options
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --highlight-line \
  --info=inline-right \
  --ansi \
  --layout=reverse \
  --border=none
  --color=bg+:#283457 \
  --color=bg:#16161e \
  --color=border:#27a1b9 \
  --color=fg:#c0caf5 \
  --color=gutter:#16161e \
  --color=header:#ff9e64 \
  --color=hl+:#2ac3de \
  --color=hl:#2ac3de \
  --color=info:#545c7e \
  --color=marker:#ff007c \
  --color=pointer:#ff007c \
  --color=prompt:#2ac3de \
  --color=query:#c0caf5:regular \
  --color=scrollbar:#27a1b9 \
  --color=separator:#ff9e64 \
  --color=spinner:#ff007c \
"

# fzf key bindings and fuzzy completion
FZF_ALT_C_COMMAND='' eval "$(fzf --bash)"

# Password storage
export PASSWORD_STORE_DIR="$HOME"/.local/share/pass

# less options
export LESS='-iFRX'

# npm per-user configuration file
export NPM_CONFIG_USERCONFIG="$HOME"/.config/npm/npmrc

# Restic
. "$HOME"/.config/restic/default-repo

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
