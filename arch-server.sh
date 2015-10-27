#!/bin/bash

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -Syy --needed \
  btrfs-progs \
  colordiff \
  dnsutils \
  htop \
  iotop \
  ipcalc \
  linux-headers \
  lsof \
  makepasswd \
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

