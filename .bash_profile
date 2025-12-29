# Read and execute commands from .bashrc
[ -f "$HOME"/.bashrc ] && . "$HOME"/.bashrc

# GnuPG home
export GNUPGHOME="$HOME"/.local/share/gnupg
