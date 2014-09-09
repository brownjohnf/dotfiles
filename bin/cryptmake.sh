#!/bin/bash

lsblk
echo "--> This will partition, encrypt, format, and mount a device at $1\1"

sudo fdisk $1 &&
  sudo cryptsetup luksFormat $1\1 &&
  sudo cryptsetup luksOpen $1\1 $2 &&
  sudo mkfs -t ext4 /dev/mapper/$2 &&
  sudo mount /dev/mapper/$2 /mnt/$2 &&
  echo "--> Your new volume is encrypted, formatted, and mounted at /mnt/$2"

lsblk

