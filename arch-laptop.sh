#!/bin/bash

set -ex

# Set the keymap to dvorak if we're on a laptop.
sudo localectl --no-convert set-x11-keymap us pc104 dvorak

sudo pacman -S --needed --noconfirm \
  acpi \
  ethtool \
  light \
  powertop \
  upower

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

# Enable services on system boot, and start them now
sudo systemctl enable --now powertop.service
sudo systemctl enable --now upower.service

