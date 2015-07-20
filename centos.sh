#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

echo '--> Installing dependencies...'
sudo yum update -y && sudo yum install -y \
  curl \
  git \
  iotop \
  nmap \
  screen \
  tmux \
  unzip \
  vim \
  wget \
  whois \
  zsh

./linux.sh

chsh -s /bin/zsh

