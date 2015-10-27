#!/bin/bash

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -Syy --needed \
  chromium \
  epiphany \
  firefox \
  gstreamer0.10-base \
  htop \
  i3-wm \
  qt4 \
  rsync \
  terminator \
  uzbl-browser \
  virtualbox \
  vlc \
  xorg \
  xorg-xinit \
  xsel

# grab AUR packages
mkdir -p $HOME/builds
if ![ -f $HOME/builds/sublime-text-dev.tar.gz ]; then
  curl https://aur.archlinux.org/packages/su/sublime-text-dev/sublime-text-dev.tar.gz > $HOME/builds/sublime-text-dev.tar.gz
fi
echo "--> Downloaded suggested AUR archives to ~/builds."

# X
ln -fs $HERE/x/.xmodmaprc $HOME/.xmodmaprc
ln -fs $HERE/x/.xinitrc $HOME/.xinitrc
if [ -f $HOME/.displays ]; then
  echo "--> displays config already in place; skipping."
else
  cp $HERE/x/.displays $HOME/.displays
fi

# set the default browser to firefox
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

