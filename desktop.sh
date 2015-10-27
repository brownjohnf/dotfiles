#!/bin/bash

set -e

if [ $(uname -a | grep Ubuntu | wc -l) -gt 0 ]; then
  echo '--> Assuming Ubuntu... (5s)'
  sleep 5
  ./ubuntu-desktop.sh
elif [ $(uname -a | grep Arch | wc -l) -gt 0 ]; then
  echo '--> Assuming Arch... (5s)'
  sleep 5
  ./arch-desktop.sh
elif [ $(uname -a | grep CentOS | wc -l) -gt 0 ]; then
  echo '--> Assuming CentOS... (5s)'
  sleep 5
  ./centos-desktop.sh
else
  echo '! OS not recognized:'
  echo $(uname -a)
  exit 1
fi

echo '--> Running generic linux-server bootstrap...'
./linux-desktop.sh

