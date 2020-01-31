#!/bin/bash

set -eu
set -o pipefail

USER=$(whoami)

echo '--> Installing dependencies...'
sudo apt-get update -y && sudo apt-get install -y aptitude

# Go back and install everything
sudo aptitude update && sudo aptitude install \
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
  neovim \
  wget \
  whois \
  zlib1g-dev \
  zsh

sudo ln -s $(which nvim) /usr/local/bin/vim

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

