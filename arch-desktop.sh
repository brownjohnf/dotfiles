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
  libreoffice \
  lxdm \
  openvpn \
  pavucontrol \
  redshift \
  remmina \
  riot-desktop \
  sane \
  seahorse \
  signal-desktop \
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

# Install yay for managing AUR packages
build_from_aur yay https://aur.archlinux.org/yay-bin.git

yay -S --needed \
  networkmanager-dmenu-git \
  slack-desktop \
  zoom

# Print any helpful output
cat <<EOF



arch-desktop setup complete.

Install brscan4 from AUR for scanning support with Brother DCP-L25400W
EOF

