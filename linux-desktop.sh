#!/bin/bash

set -x
set -e

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/bin

# alacritty
ln -fs $HERE/alacritty/.alacritty.yml   $HOME/.alacritty.yml

# Terminator
ln -fs $HERE/terminator/config   $HOME/.config/terminator/config

echo "SUCCESS"

