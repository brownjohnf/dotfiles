#!/bin/bash

source ./config.sh

# install packages
sudo pacman -S --needed \
  alacritty \
  android-tools \
  chromium \
  code \
  cups \
  cups-pdf \
  dmenu \
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
  pavucontrol \
  powertop \
  redshift \
  remmina \
  sane \
  seahorse \
  thunar \
  tumbler \
  virtualbox \
  vlc \
  xorg \
  xorg-xinit \
  xsel

sudo systemctl enable lxdm.service
sudo localectl --no-convert set-x11-keymap us pc104 dvorak

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

mkdir -p $binpath
ln -fs $HERE/bin/displays $binpath/displays

# set the default browser to firefox
mkdir -p $HOME/.local/share/applications
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

# Install package-query and yaourt from repo
build_from_aur yaourt https://aur.archlinux.org/package-query.git
build_from_aur yaourt https://aur.archlinux.org/yaourt.git

yaourt -S --needed \
  networkmanager-dmenu-git \
  slack-desktop \
  zoom

cat <<EOF



arch-desktop setup complete.

Install brscan4 from AUR for scanning support with Brother DCP-L25400W
EOF

