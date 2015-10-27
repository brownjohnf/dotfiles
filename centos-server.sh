#!/bin/bash

set -e
set -x

USER=$(whoami)
GROUP=$(id -gn)
HERE=$(pwd)
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

