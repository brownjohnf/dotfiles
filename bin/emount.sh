#!/bin/bash

echo "--> Mounting $1 at /mnt/$2..."
lsblk
sudo mkdir -p /mnt/$2
sudo cryptsetup luksOpen $1 $2 && sudo mount /dev/mapper/$2 /mnt/$2
pcmanfm /mnt/$2 &
lsblk
echo "--> Mounting complete."
