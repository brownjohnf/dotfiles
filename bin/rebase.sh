#!/bin/bash

set -e
set -x

git fetch upstream
git pull --rebase upstream master

if [ -f rebase.local.sh ]; then
	./rebase.local.sh
fi

