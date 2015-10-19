#!/bin/bash

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -Syy --needed \
  btrfs-progs \
  chromium \
  colordiff \
  dnsutils \
  epiphany \
  firefox \
  gstreamer0.10-base \
  htop \
  i3-wm \
  iotop \
  ipcalc \
  linux-headers \
  lsof \
  makepasswd \
  nodejs \
  nethogs \
  net-tools \
  openssh \
  parted \
  qt4 \
  readline \
  redshift \
  rsync \
  ruby \
  sudo \
  terminator \
  tmux \
  traceroute \
  unzip \
  uzbl-browser \
  vagrant \
  vim \
  virtualbox \
  vlc \
  wget \
  xorg \
  xorg-xinit \
  xsel \
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

