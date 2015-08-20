#!/bin/bash

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -S --needed \
  btrfs-progs \
  chromium \
  dnsutils \
  epiphany \
  firefox \
  gstreamer0.10-base \
  htop \
  i3-wm \
  nethogs \
  openssh \
  parted \
  redshift \
  sudo \
  terminator \
  tmux \
  unzip \
  uzbl-browser \
  vim \
  wget \
  xorg \
  xorg-xinit \
  zsh

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

./linux.sh

