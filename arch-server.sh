#!/bin/bash

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -Syy --needed \
  ack \
  btrfs-progs \
  colordiff \
  dnsutils \
  htop \
  iotop \
  ipcalc \
  linux-headers \
  lsof \
  #makepasswd \ need to install from AUR
  nethogs \
  net-tools \
  openssh \
  parted \
  readline \
  rsync \
  sudo \
  tmux \
  traceroute \
  unzip \
  vagrant \
  vim \
  wget \
  zsh

