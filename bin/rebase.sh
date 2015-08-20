#!/bin/bash

set -e
set -x

git fetch origin
git fetch upstream
git pull --rebase upstream master

if [ -f rebase.local.sh ]; then
  ./rebase.local.sh
fi

