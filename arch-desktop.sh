#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -S --needed \
  alsa-utils \
  android-tools \
  chromium \
  cups \
  cups-pdf \
  docker \
  epiphany \
  firefox \
  ghostscript \
  go \
  gsfonts \
  gstreamer0.10-base \
  htop \
  i3 \
  openvpn \
  qt4 \
  redshift \
  rsync \
  sane \
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
  echo "TODO: get makepasswd"
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
mkdir -p $HOME/.local/share/applications
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

echo "--> Setup complete. Consider installing the following from the AUR:
* slack-desktop
* spoty
* wrk
"

1>&2 echo "! Install brscan4 from AUR for scanning support with Brother DCP-L25400W"

