#!/bin/bash

source ./config.sh

# install packages
sudo pacman -S --needed --noconfirm \
  alacritty \
  android-tools \
  archiso \
  cargo-edit \
  chromium \
  cups \
  cups-pdf \
  dmenu \
  feh \
  firefox \
  ghostscript \
  gnome-keyring \
  gnome-screenshot \
  go-tools \
  graphviz \
  gsfonts \
  hacksaw \
  htop \
  i3status-rust \
  i3-gaps \
  i3lock \
  keybase-gui \
  libpng \
  libreoffice \
  libvncserver \
  lxdm \
  mesa-demos \
  network-manager-applet \
  nodejs \
  pamixer \
  pavucontrol \
  playerctl \
  poppler-glib \
  postgresql-libs \
  redshift \
  remmina \
  element-desktop \
  rust-analyzer \
  sane \
  seahorse \
  shotgun \
  signal-desktop \
  thunar \
  transmission-cli \
  ttf-font-awesome \
  tumbler \
  virtualbox \
  virtualbox-host-modules-arch \
  vlc \
  wireshark-cli \
  wireshark-qt \
  x11-ssh-askpass \
  xorg \
  xorg-server-xephyr \
  xorg-xclock \
  xorg-xinit \
  xsel \
  zlib

sudo systemctl enable lxdm.service

# If the device has bluetooth, install the tools we need to manage it.
if dmesg | grep Bluetooth; then
  sudo pacman -S --needed --noconfirm \
    blueman \
    bluez \
    bluez-utils \
    pulseaudio-bluetooth
  sudo modprobe btusb
  sudo systemctl enable bluetooth.service
  sudo systemctl start bluetooth.service
fi

# set the default browser to firefox
mkdir -p $HOME/.local/share/applications
xdg-mime default firefox.desktop x-scheme-handler/http
xdg-mime default firefox.desktop x-scheme-handler/https

# Install AUR packages with yay (yay gets installed in arch-server)
yay -S --needed \
  --answerdiff None \
  --answeredit None \
  --answerclean NotInstalled \
  heroku-cli \
  leftwm \
  networkmanager-dmenu-git \
  slack-desktop \
  spotify \
  sysdig-inspect \
  zoom

# Print any helpful output
cat <<EOF



arch-desktop setup complete.

Install brscan4 from AUR for scanning support with Brother DCP-L25400W
EOF

