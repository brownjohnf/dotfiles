#!/bin/bash

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

# alacritty
mkdir -p $HOME/.config/alacritty
ln -fs $HERE/alacritty/alacritty.yml $HOME/.config/alacritty/alacritty.yml

echo "SUCCESS"

# YouCompleteMe
# Source the zshrc so we pick up any env settings
#source $HOME/.zshrc
(cd $HOME/.vim/plugged/YouCompleteMe && python3 install.py)

echo "

Linux desktop setup complete.

To remove the horizontal tabs in Firefox, create the following file (you may
need to create the file/directory):

~/.mozilla/firefox/<your profile>/chrome/userChrome.css

Put in the following contents:

#TabsToolbar {
  visibility: collapse;
}

#titlebar {
  display: none;
}

Open about:config and search for the
'toolkit.legacyUserProfileCustomizations.stylesheets' setting. Set it to true.
This will cause Firefox to read the userChrome.css file.

Restart Firefox and you should be good to go. Details can be found at
https://www.userchrome.org/how-create-userchrome-css.html.

You should also add the following to the Tab Center Redux config in FF to fix useless
features:

#topmenu {
  display: none;
}

#tablist-wrapper.shrinked .tab:not(.pinned) {
  height: 29px !important;
}

"
