#!/bin/bash

set -eu
set -o pipefail

USER=$(whoami)

sudo add-apt-repository -y ppa:kelleyk/emacs

# Go back and install everything
sudo aptitude update && sudo aptitude install -y \
  apache2-utils \
  build-essential \
  cryptsetup \
  curl \
  dkms \
  ecryptfs-utils \
  emacs26 \
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

sudo snap install --classic ripgrep

sudo ln -fs $(which nvim) /usr/local/bin/vim

# Docker
which docker || (wget -qO- https://get.docker.com/ | sh)

# Heroku
wget -O- https://toolbelt.heroku.com/install.sh | sh

# diff-so-fancy

sudo bash -c 'curl -sL \
    https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy \
  > /usr/local/bin/diff-so-fancy'
sudo chmod +x /usr/local/bin/diff-so-fancy

./linux-server.sh

