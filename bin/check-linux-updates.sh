#!/bin/bash

set -eux
set -o pipefail

newVersion=$(curl -s https://www.archlinux.org/packages/search/json/?name=linux \
  | jq -r ".results | map(select(.repo == \"core\")) | .[0] | .pkgver + \"-\" + .pkgrel")

echo $?
echo $newVersion

if [ $? -eq 6 ]; then
  echo '{"full_text": "INT", "color": "#ffffff"}'
fi

currentVersion=$(pacman -Q linux | cut -f 2 -d ' ')

if [ "${newVersion}" != "${currentVersion}" ]; then
  echo '{"full_text": "NO", "color": "#ff0000"}'
fi

echo '{"full_text": "OK", "color": "#00ff00"}'

