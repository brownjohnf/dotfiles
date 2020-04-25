#!/bin/bash

set -u
set -o pipefail

# It's important that this script not write anything to stdout except the JSON
# output

# Make sure we have an internet connection.
if ! ping -c 1 www.fsf.org > /dev/null; then
  echo '{"full_text": "OFFLINE", "color": "#ffffff"}'
  exit 0
fi

trap "rm -f /tmp/clu-$$.txt > /dev/null" EXIT

# Check to see if there are any updates. For some weird reason the checkupdates
# script fails a lot, so we run it until it succeeds. This will run a lot with
# no internet available... TODO: Figure that out.
while ! checkupdates > /tmp/clu-$$.txt; do
  sleep 1
done

# If there are updates, check to see whether any of them will require a reboot
# Grab a list of matching hits
hits=$(cat /tmp/clu-$$.txt \
  | grep -oE '(^linux|[^l]lvm|device\-mapper|systemd|zfs|wireguard)\S{0,4}' \
  | uniq \
  | tr '\n' ' ' \
  | slit)

if [ "$hits" != "" ]; then
  cat <<EOF
{"full_text": "$hits", "color": "#ff0000"}
EOF
  exit 0
fi

# We're good to do an update any time!
cat <<EOF
{"full_text": "OK", "color": "#00ff00"}
EOF

