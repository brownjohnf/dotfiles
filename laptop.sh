#!/bin/bash

set -e
set -x

./server.sh
./desktop.sh

if grep 'Arch Linux' /etc/os-release; then
  echo '--> Assuming Arch... (5s)'
  sleep 3
  ./arch-laptop.sh
fi

