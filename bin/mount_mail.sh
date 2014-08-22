echo "--> unmounting default usb mount point..."
sudo umount /media/jfbrown/VIDEOS
echo "    done.\n--> mounting..."
sudo mount /dev/sdb1 /mnt/mail -o uid=1000,gid=1000,utf8,dmask=027,fmask=137
ls /mnt/mail
echo "--> mail mounted at /mnt/mail"

