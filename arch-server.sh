#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -S --needed \
  bat \
  colordiff \
  cronie \
  ctags \
  diff-so-fancy \
  dnsutils \
  gnupg \
  htop \
  iotop \
  ipcalc \
  linux-headers \
  lsof \
  nethogs \
  net-tools \
  openssh \
  openssl \
  pacman-contrib \
  parted \
  readline \
  ripgrep \
  rsync \
  sshpass \
  strace \
  sudo \
  sysdig \
  the_silver_searcher \
  tmux \
  traceroute \
  tree \
  unzip \
  vagrant \
  vim \
  wget \
  whois \
  zip \
  zsh

