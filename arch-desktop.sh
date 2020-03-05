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
  pamixer \
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

# set the default browser to firefox
mkdir -p $HOME/.local/share/applications
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

# Install yay for managing AUR packages
build_from_aur yay https://aur.archlinux.org/yay-bin.git

yay -S --needed \
  --answerdiff None \
  --answeredit None \
  --answerclean NotInstalled \
  networkmanager-dmenu-git \
  slack-desktop \
  spotify \
  zoom

# Print any helpful output
cat <<EOF



arch-desktop setup complete.

Install brscan4 from AUR for scanning support with Brother DCP-L25400W
EOF

