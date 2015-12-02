#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

echo '--> Installing dependencies...'
sudo apt-get update -y && sudo apt-get install -y aptitude

# Go back and install everything
sudo aptitude update && sudo aptitude install \
  ack-grep \
  apache2-bench \
  build-essential \
  cryptsetup \
  curl \
  dkms \
  ecryptfs-utils \
  exuberant-ctags \
  git \
  iftop \
  iotop \
  ipcalc \
  htop \
  libreadline-dev \
  libssl-dev \
  nethogs \
  nfs-common \
  nmap \
  libsqlite3-dev \
  libxml2-dev \
  terminator \
  tmux \
  traceroute \
  tree \
  unzip \
  vim \
  wget \
  whois \
  zlib1g-dev \
  zsh

# Docker
wget -qO- https://get.docker.com/ | sh

# Heroku
wget -O- https://toolbelt.heroku.com/install.sh | sh

./linux-server.sh

