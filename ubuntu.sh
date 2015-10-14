#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

echo '--> Installing dependencies...'
sudo apt-get update -y && sudo apt-get install -y aptitude
sudo aptitude update && sudo aptitude install -y \
	vim curl htop wget screen git alsa-base unzip \
	alsa-tools alsa-utils build-essential leafpad \
	chromium-browser cryptsetup pcmanfm dkms ecryptfs-utils \
	vlc libreadline-dev firefox nethogs iotop iftop xsel xfce4-terminal \
	nmap whois network-manager-openvpn nfs-common \
	i3 i3-wm i3lock i3status xinit x11-xserver-utils xfce4-terminal \
	python-numpy python-opengl openscad python-wxgtk2.8 zsh tmux

# Sublime & Cura
curl "http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb" > /tmp/sublime.deb
curl "software.ultimaker.com/current/cura_15.04-debian_amd64.deb" > /tmp/cura.deb
sudo dpkg -i /tmp/sublime.deb /tmp/cura.deb

# Docker
wget -qO- https://get.docker.com/ | sh

# Hipchat
sudo sh -c "
echo deb http://downloads.hipchat.com/linux/apt stable main \
> /etc/apt/sources.list.d/atlassian-hipchat.list
"
sudo sh -c "
wget -O - https://www.hipchat.com/keys/hipchat-linux.key | apt-key add -
"

# Spotify
sudo sh -c '
grep spotify /etc/apt/sources.list \
	|| echo "deb http://repository.spotify.com stable non-free" >> /etc/apt/sources.list
'
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 94558F59

# Install from custom repos
sudo aptitude update
sudo aptitude install -y spotify-client hipchat

./linux.sh

