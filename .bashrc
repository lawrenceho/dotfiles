# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Ignore duplicates and lines beginning with a space in history
HISTCONTROL=ignoreboth

# Append history after each command
PROMPT_COMMAND="${PROMPT_COMMAND:+"$PROMPT_COMMAND; "}history -a"

# Append history upon shell exit
shopt -s histappend

# Check window size after each external (non-builtin) command
shopt -s checkwinsize

# User specific environment
if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin":"$PATH"
fi

# Default editor
export EDITOR='vi'

# git with bare .dotfiles support
git() {
  if [ "$PWD" = "$HOME" ]; then
    command git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
  else
    command git "$@"
  fi
}

# lazygit with bare .dotfiles support
lazygit() {
  if [ "$PWD" = "$HOME" ]; then
    command lazygit -g "$HOME/.dotfiles" -w "$HOME" "$@"
  else
    command lazygit "$@"
  fi
}

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

# SSH agent
SSH_AUTH_SOCK="/run/user/$(id -u)/ssh-agent.socket"
export SSH_AUTH_SOCK

# Password storage
export PASSWORD_STORE_DIR="$HOME/.local/share/pass"

# less options
export LESS='-iFRX'

# Restic
if [ -f "$HOME/.config/restic/default-repo" ]; then
  . "$HOME/.config/restic/default-repo"
fi

# Cargo
if [ -f "$HOME/.cargo/env" ]; then
  . "$HOME/.cargo/env"
fi

# mise
eval "$(mise activate bash)"

# Prompt
PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
