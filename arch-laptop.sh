#!/bin/bash

set -ex

sudo pacman -S --needed \
  acpi \
  ethtool \
  light \
  powertop

# Create a unit file so we can always run powertop to improve battery life
cat <<EOF | sudo tee /etc/systemd/system/powertop.service
[Unit]
Description=Powertop tunings

[Service]
Type=exec
ExecStart=/usr/bin/powertop --auto-tune
RemainAfterExit=true

[Install]
WantedBy=multi-user.target
EOF

# Enable powertop on system boot
sudo systemctl enable powertop.service
# Start it now so we get it immediately
sudo systemctl start powertop.service

