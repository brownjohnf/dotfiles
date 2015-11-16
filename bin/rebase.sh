#!/bin/bash

set -e
set -x

# Detect the correct remote to use for rebasing
if [ $(git remote | grep upstream | wc -l) -gt 0 ]; then
  remote=upstream
else
  remote=origin
fi

git remote update
git pull --rebase $remote master

if [ -f .rebase.local.sh ]; then
  ./.rebase.local.sh
fi

