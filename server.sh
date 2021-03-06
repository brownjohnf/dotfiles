#!/bin/sh

set -e

mkdir -p $HOME/workspace

if [ $(uname -a | grep Ubuntu | wc -l) -gt 0 ]; then
  echo '--> Assuming Ubuntu... (5s)'
  sleep 2
  ./ubuntu-server.sh
elif grep 'Arch Linux' /etc/os-release; then
  echo '--> Assuming Arch... (5s)'
  sleep 2
  ./arch-server.sh
elif [ $(uname -a | grep CentOS | wc -l) -gt 0 ]; then
  echo '--> Assuming CentOS... (5s)'
  sleep 2
  ./centos-server.sh
elif [ $(uname -a | grep NixOS | wc -l) -gt 0 ]; then
  echo '--> Assuming NixOS... (5s)'
  sleep 2
  ./nixos-server.sh
else
  echo '! OS not recognized:'
  echo $(uname -a)
  exit 1
fi

echo '--> Running generic linux-server bootstrap...'
./linux-server.sh

