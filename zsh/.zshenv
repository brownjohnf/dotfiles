export MANPATH=/usr/local/opt/coreutils/libexec/gnuman:$MANPATH
export PATH="/usr/local/opt/gettext/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$HOME/go/bin:/usr/local/opt/coreutils/libexec/gnubin:$PATH"

if grep 'Ubuntu' /etc/os-release; then
  export PATH="/snap/bin:$PATH"
fi
