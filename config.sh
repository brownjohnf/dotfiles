#!/bin/bash

set -eo pipefail

HERE="$HOME/dotfiles"
binpath=$HOME/.bin

function clone_or_update() {
  repo=$1
  dest=$2

  if [ -d $dest ]; then
    (cd $dest && git pull)
  else
    git clone $repo $dest
  fi
}
