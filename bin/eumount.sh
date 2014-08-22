#!/bin/bash

echo "--> Unmounting /mnt/$1..."
sudo umount /mnt/$1 && sudo cryptsetup luksClose /dev/mapper/$1
echo "--> Unounting complete."

