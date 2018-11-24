#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/.bin

# install packages
sudo pacman -S --needed \
  base-devel \
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
  neovim \
  nethogs \
  net-tools \
  nfs-utils \
  ngrep \
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
  sysstat \
  the_silver_searcher \
  tmux \
  traceroute \
  tree \
  ufw \
  unzip \
  vagrant \
  wget \
  whois \
  zip \
  zsh

