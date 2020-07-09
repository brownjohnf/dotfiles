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

# i3blocks
mkdir -p $HOME/.config/i3blocks
ln -fs $HERE/i3blocks/config $HOME/.config/i3blocks/config

# Add i3blocks-contrib
clone_or_update \
  https://github.com/vivien/i3blocks-contrib $HOME/.config/i3blocks-contrib

# LeftWM
mkdir -p $HOME/.config/leftwm/themes
ln -fs $HERE/leftwm/config.toml $HOME/.config/leftwm/config.toml

# alacritty
mkdir -p $HOME/.config/alacritty
ln -fs $HERE/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

echo "SUCCESS"

# YouCompleteMe
# Source the zshrc so we pick up any env settings
#source $HOME/.zshrc
(cd $HOME/.vim/plugged/YouCompleteMe && python3 install.py)

# Install some rust binaries that are nice
which exa || cargo install exa

echo "

Linux desktop setup complete. Add the following to the file (you may
need to create the file and the chrome directory):

~/.mozilla/firefox/<your profile>/chrome/userChrome.css

@namespace url(\"http://www.mozilla.org/keymaster/gatekeeper/there.is.only.xul\");
#TabsToolbar {
  visibility: collapse !important;
}

to fix the horizontal tabs in FF.
"

echo "

You should also add the following to the Tab Center Redux in FF to fix useless
features:

#topmenu {
  display: none;
}

#tablist-wrapper.shrinked .tab:not(.pinned) {
  height: 29px !important;
}

"
