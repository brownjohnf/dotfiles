#!/bin/bash

set -ex

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
  feh \
  firefox \
  ghostscript \
  gnome-screenshot \
  go \
  graphviz \
  gsfonts \
  htop \
  i3 \
  keepassx \
  libreoffice \
  openvpn \
  qt4 \
  redshift \
  rsync \
  sane \
  terminator \
  thunar \
  thunderbird \
  tumbler \
  virtualbox \
  vlc \
  xorg \
  xorg-xinit \
  xsel

# Install yaourt from repo
mkdir -p $HOME/builds
if [ -d $HOME/builds/yaourt ]; then
  (cd $HOME/builds/yaourt && git pull --rebase origin master)
else
  git clone https://aur.archlinux.org/yaourt.git $HOME/builds/yaourt
fi
(cd $HOME/builds/yaourt && makepkg -sric --needed)

yaourt -S --needed \
  libcurl-compat \
  gitter \
  gstreamer0.10-base \
  makepasswd \
  networkmanager-dmenu-git \
  package-query \
  perl-bytes-random-secure \
  perl-crypt-random-seed \
  perl-crypt-random-tesha2 \
  rocketchat-client \
  slack-desktop \
  sublime-text-dev \
  zoom

# X
ln -fs $HERE/x/.xmodmaprc $HOME/.xmodmaprc
ln -fs $HERE/x/.xinitrc $HOME/.xinitrc
ln -fs $HERE/bin/displays $HOME/bin/displays

# set the default browser to firefox
mkdir -p $HOME/.local/share/applications
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

echo "--> Setup complete. Consider installing the following from the AUR:"

1>&2 echo "! Install brscan4 from AUR for scanning support with Brother DCP-L25400W"

