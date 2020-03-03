#!/bin/bash

source ./config.sh

# install packages
sudo pacman -S --needed \
  base-devel \
  bat \
  clang \
  colordiff \
  cronie \
  ctags \
  diff-so-fancy \
  dnsutils \
  docker \
  docker-compose \
  emacs \
  fd \
  git \
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
  nmap \
  openssh \
  ovmf \
  pacman-contrib \
  parted \
  prettyping \
  python-pip \
  qemu \
  readline \
  ripgrep \
  rsync \
  sshfs \
  sshpass \
  strace \
  sudo \
  sysstat \
  tar \
  tmux \
  traceroute \
  tree \
  ttf-dejavu \
  ufw \
  unzip \
  vagrant \
  wget \
  whois \
  zip \
  zsh

sudo ln -fs $(which nvim) /usr/local/bin/vim

sudo systemctl enable ufw
sudo systemctl start ufw
sudo ufw status
sudo ufw default deny
sudo ufw limit ssh
sudo ufw status

