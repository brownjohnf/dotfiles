#!/bin/bash

set -e

# grab the command; if there isn't one, assume it's help
if [ $# -gt 0 ]; then
  command=$1; shift
else
  command="help"
fi

# this case statement checks for args only, and takes appropriate action
# it's basically a pre-filter so we know the main case statement gets good data
case $command in
  mount|create)
    if [ $# -lt 2 ]; then
      echo "You must supply a device and mountpoint!"
      $0 help

      exit 1
    fi

    device=$1; shift
    mountpoint=$1; shift
  ;;
  umount)
    if [ $# -lt 1 ]; then
      echo "You must supply a mountpoint!"
      $0 help

      exit 1
    fi

    mountpoint=$1; shift
  ;;
esac

# main app case statement; it runs the appropriate code chunk
case $command in
  list)
    lsblk
    echo "---"
    ls -la /dev/mapper | egrep '\->' | awk '{print $9}'
  ;;
  mount)
    echo "--> Mounting $device at /mnt/$mountpoint"
    sudo mkdir -p /mnt/$mountpoint
    sudo cryptsetup luksOpen $device $mountpoint
    sudo mount /dev/mapper/$mountpoint /mnt/$mountpoint
    echo "--> Mounting complete."
  ;;
  umount)
    echo "--> Unmounting /mnt/$mountpoint..."
    sudo umount /mnt/$mountpoint
    sudo cryptsetup luksClose /dev/mapper/$mountpoint
    echo "--> Unmounting complete."
  ;;
  create)
    echo "--> This will partition, encrypt, format, and mount a device at $1\1"
    sudo fdisk $device
    sudo cryptsetup luksFormat $device
    sudo cryptsetup luksOpen $device $mountpoint
    sudo mkfs -t ext4 /dev/mapper/$mountpoint
    sudo mkdir -p /mnt/$mountpoint
    sudo mount /dev/mapper/$mountpoint /mnt/$mountpoint
    echo "--> Your new volume is encrypted, formatted, and mounted at /mnt/$2"
  ;;
  *)
    echo "Usage: $0 [mount|umount|create|--help] /path/to/dev3 mntpoint"
  ;;
esac
