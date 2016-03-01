#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -Syy --needed \
  ack \
  colordiff \
  dnsutils \
  htop \
  iotop \
  ipcalc \
  linux-headers \
  lsof \
  nethogs \
  net-tools \
  openssh \
  parted \
  readline \
  rsync \
  sshpass \
  sudo \
  tmux \
  traceroute \
  unzip \
  vagrant \
  vim \
  wget \
  zsh

