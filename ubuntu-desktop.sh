#!/bin/bash

set -e
set -x

USER=$(whoami)

echo '--> Installing dependencies...'
[ -f "$(which aptitude)" ] || (sudo apt-get update -y > /dev/null && sudo apt-get install -y aptitude > /dev/null)


# Go back and install everything
sudo aptitude update && sudo aptitude install -y \
  awscli \
  firefox \
  gparted \
  i3 \
  i3blocks \
  i3lock \
  i3status \
  i3-wm \
  libreadline-dev \
  network-manager-openvpn \
  redshift \
  vlc \
  x11-xserver-utils \
  xinit \
  xsel

sudo snap install spotify
sudo snap install --classic slack

