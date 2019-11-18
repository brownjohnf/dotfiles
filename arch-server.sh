#!/bin/bash

source ./config.sh

# install packages
sudo pacman -S --needed \
  base-devel \
  bat \
  colordiff \
  cronie \
  ctags \
  diff-so-fancy \
  dnsutils \
  docker \
  docker-compose \
  emacs \
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
  pacman-contrib \
  parted \
  prettyping \
  python-pip \
  readline \
  ripgrep \
  rsync \
  sshpass \
  strace \
  sudo \
  sysstat \
  the_silver_searcher \
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

