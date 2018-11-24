#!/bin/bash

set -ex

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

sudo localectl --no-convert set-x11-keymap us pc104 dvorak

# install packages
sudo pacman -S --needed \
  android-tools \
  chromium \
  code \
  cups \
  cups-pdf \
  docker \
  feh \
  firefox \
  ghostscript \
  gnome-keyring \
  gnome-screenshot \
  go \
  graphviz \
  gsfonts \
  htop \
  i3blocks \
  i3-gaps \
  i3lock \
  keepassx \
  libreoffice \
  lxdm \
  openvpn \
  qt4 \
  redshift \
  remmina \
  rsync \
  rust \
  sane \
  seahorse \
  terminator \
  thunar \
  ttf-dejavu \
  tumbler \
  virtualbox \
  vlc \
  xorg \
  xorg-xinit \
  xsel

function build_from_aur () {
  name=$1
  repo=$2

  build_root=/tmp/builds
  build_path=$build_root/$name

  rm -rf $build_path
  mkdir -p $build_root
  git clone $repo $build_path
  (cd $build_path && makepkg -sric --needed)
}

ln -fs $HERE/bin/displays $HOME/bin/displays

# set the default browser to firefox
mkdir -p $HOME/.local/share/applications
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

# Install package-query and yaourt from repo
build_from_aur yaourt https://aur.archlinux.org/package-query.git
build_from_aur yaourt https://aur.archlinux.org/yaourt.git

yaourt -S --needed \
  libcurl-compat \
  gstreamer0.10-base \
  makepasswd \
  networkmanager-dmenu-git \
  perl-bytes-random-secure \
  perl-crypt-random-seed \
  perl-crypt-random-tesha2 \
  prettyping \
  rocketchat-client \
  slack-desktop \
  zoom


cat <<EOF



arch-desktop setup complete.

Install brscan4 from AUR for scanning support with Brother DCP-L25400W
EOF

