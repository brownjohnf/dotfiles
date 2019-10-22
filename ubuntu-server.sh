#!/bin/bash

set -eu
set -o pipefail

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

echo '--> Installing dependencies...'
sudo apt-get update -y && sudo apt-get install -y aptitude

# Go back and install everything
sudo aptitude update && sudo aptitude install \
  ack-grep \
  apache2-utils \
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
which docker || (wget -qO- https://get.docker.com/ | sh)

# Heroku
wget -O- https://toolbelt.heroku.com/install.sh | sh

# diff-so-fancy

sudo bash -c 'curl -sL \
    https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy \
  > /usr/local/bin/diff-so-fancy'
sudo cdmod +x /usr/local/bin/diff-so-fancy

./linux-server.sh

