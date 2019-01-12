#!/bin/bash

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

# sublime
mkdir -p $HOME/.config/sublime-text-3/Packages/User
ln -fs $HERE/sublime/.sublime/Preferences.sublime-settings \
  $HOME/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

echo "

Linux desktop setup complete. Add the following to the file

~/.mozilla/firefox/<your profile>/chrome/userChrome.css

to fix the horizontal tabs in FF

You should also add the following to the Tab Center Redux in FF to fix useless
features:

#topmenu {
  display: none;
}

#tablist-wrapper.shrinked .tab:not(.pinned) {
  height: 29px !important;
}

"
