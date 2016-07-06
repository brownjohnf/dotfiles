#!/bin/bash

set -x
set -e

USER=$(whoami)
GROUP=$(id -gn)
HERE="$HOME/dotfiles"
binpath=$HOME/bin
path=$HOME/builds

touch $path

# Clone AUR repos

for repo in google-chrome libcurl-compat makepasswd perl-bytes-random-secure perl-bytes-random-seed perl-bytes-tesha2 perl-crypt-random-seed perl-crypt-random-tesha2 slack-desktop spotify; do
  if [ -d $path/$repo ]; then
    ( cd $path/$repo  && git reset --hard && git pull )
  else
    echo "--> Cloning $repo ..."
    git clone https://aur.archlinux.org/$repo.git $path/$repo
  fi
done

echo "SUCCESS"

