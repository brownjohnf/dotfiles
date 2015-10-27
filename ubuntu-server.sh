#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

echo '--> Installing dependencies...'
sudo apt-get update -y > /dev/null && sudo apt-get install -y aptitude > /dev/null

# Go back and install everything
sudo aptitude update > /dev/null  && sudo aptitude install -y \
  build-essential \
  cryptsetup \
  curl \
  dkms \
  ecryptfs-utils \
  git \
  iftop \
  iotop \
  ipcalc \
  htop \
  libreadline-dev \
  nethogs \
  nfs-common \
  nmap \
  python-numpy \
  python-opengl \
  python-wxgtk2.8 \
  tmux \
  unzip \
  vim \
  wget \
  whois \
  zsh \
  > /dev/null

# Docker
wget -qO- https://get.docker.com/ | sh

./linux-server.sh

