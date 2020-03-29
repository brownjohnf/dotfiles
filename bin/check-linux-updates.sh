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

# Check to see if there are any updates
checkupdates > /dev/null
if [ $? -eq 2 ]; then
  echo '{"full_text": "NA, "color": "#ffffff"}'
  exit 0
fi

# If there are updates, check to see whether any of them will require a reboot
if checkupdates | grep -E '(linux|lvm|device\-mapper|systemd|zfs)' > /dev/null; then
  cat <<HEREDOC
{"full_text": "NO", "color": "#ff0000"}
HEREDOC
  exit 0
fi

# We're good to do an update any time!
echo '{"full_text": "OK", "color": "#00ff00"}'

