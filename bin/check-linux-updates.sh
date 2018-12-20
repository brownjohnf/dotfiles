#!/bin/bash

set -eux
set -o pipefail

while ! ping -c 1 google.com; do
  sleep 10
done

if [ $? -eq 6 ]; then
  echo '{"full_text": "INT", "color": "#ffffff"}'
fi

for package in linux lvm2 device-mapper systemd; do
  newVersion=$(curl -s https://www.archlinux.org/packages/search/json/?name=${package} \
    | jq -r ".results | map(select(.repo == \"core\")) | .[0] | .pkgver + \"-\" + .pkgrel")

  currentVersion=$(pacman -Q ${package} | cut -f 2 -d ' ')

  if [ "${newVersion}" != "${currentVersion}" ]; then
    cat <<HEREDOC
{"full_text": "NO - ${package}", "color": "#ff0000"}
HEREDOC
    exit
  fi
done

echo '{"full_text": "OK", "color": "#00ff00"}'

