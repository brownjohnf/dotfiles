#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

echo '--> Installing dependencies...'
sudo apt-get update -y > /dev/null && sudo apt-get install -y aptitude > /dev/null

# Spotify
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D2C19886
echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

# Hipchat
echo deb http://downloads.hipchat.com/linux/apt stable main | sudo tee /etc/apt/sources.list.d/atlassian-hipchat.list
wget -O - https://www.hipchat.com/keys/hipchat-linux.key | sudo apt-key add -

# Go back and install everything
sudo aptitude update > /dev/null  && sudo aptitude install -y \
  vim curl htop wget screen git alsa-base unzip \
  alsa-tools alsa-utils build-essential leafpad \
  chromium-browser cryptsetup pcmanfm dkms ecryptfs-utils \
  vlc libreadline-dev firefox nethogs iotop iftop xsel xfce4-terminal \
  nmap whois network-manager-openvpn nfs-common \
  i3 i3-wm i3lock i3status xinit x11-xserver-utils xfce4-terminal \
  python-numpy python-opengl openscad python-wxgtk2.8 zsh tmux \
  ipcalc spotify-client hipchat \
  > /dev/null

# Sublime & Cura
curl "http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb" > /tmp/sublime.deb
curl "software.ultimaker.com/current/cura_15.04-debian_amd64.deb" > /tmp/cura.deb
sudo dpkg -i /tmp/sublime.deb /tmp/cura.deb > /dev/null

# Docker
wget -qO- https://get.docker.com/ | sh

./linux.sh

