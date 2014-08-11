#!/bin/bash

sudo aptitude update
sudo aptitude install -y git
cd $HOME
git clone https://github.com/brownjohnf/dotfiles.git
cd dotfiles
./dotfiles.sh install
