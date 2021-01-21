#!/usr/bin/env sh

set -ex

source ./config.sh

function clone_or_update() {
  repo=$1
  dest=$2

  if [ -d $dest ]; then
    (cd $dest && git pull)
  else
    git clone $repo $dest
  fi
}

# i3
mkdir -p $HOME/.config/i3
ln -fs $HERE/i3/config $HOME/.config/i3/config

# i3status-rs
mkdir -p $HOME/.config/i3status-rs
ln -fs $HERE/i3status-rs/config.toml $HOME/.config/i3status-rs/config.toml

# LeftWM
mkdir -p $HOME/.config/leftwm/themes
ln -fs $HERE/leftwm/config.toml $HOME/.config/leftwm/config.toml

# alacritty
mkdir -p $HOME/.config/alacritty
ln -fs $HERE/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# Mutt (email)
mkdir -p $HOME/.config/mutt
ln -fs $HERE/mutt/muttrc $HOME/.config/mutt/muttrc

# Mailcap (mime -> application mappings, used by mutt and others)
ln -fs $HERE/mailcap $HOME/.mailcap

# Signature for email. Don't symlink it since it might be different on different machines.
[[ -f $HOME/.signature ]] || cp $HERE/mutt/.signature $HOME/.signature

# YouCompleteMe
# Source the zshrc so we pick up any env settings
#source $HOME/.zshrc
(cd $HOME/.vim/plugged/YouCompleteMe && python3 install.py)

echo "SUCCESS"

# YouCompleteMe
# Source the zshrc so we pick up any env settings
#source $HOME/.zshrc
(cd $HOME/.vim/plugged/YouCompleteMe && python3 install.py)

cat <<EOF
Linux desktop setup complete.

Update the firefox config settings by going to about:config and setting the
following settings:

* privacy.firstparty.isolate = true
* toolkit.legacyUserProfileCustomizations.stylesheets = true

To fix the horizontal tabs in FF, add the following to the userChrome.css file
(you may need to create the file and the chrome directory; your profile probably
ends in '.default-release'):

~/.mozilla/firefox/<your profile>/chrome/userChrome.css

#TabsToolbar {
  visibility: collapse;
}
#titlebar {
  display: none;
}

You should also add the following to the Tab Center Redux in FF to fix useless
features:

#topmenu {
  display: none;
}
#tablist-wrapper.shrinked .tab:not(.pinned) {
  height: 29px !important;
}
EOF
