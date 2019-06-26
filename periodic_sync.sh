#!/bin/bash
rclone sync farside:/configsync /home/pi/configsync

if test -f "/home/pi/configsync/start_picture_frame.sh"
then
     file1md5=$(md5sum < /home/pi/start_picture_frame.sh)
     file2md5=$(md5sum < /home/pi/configsync/start_picture_frame.sh)
     if [ "$file1md5" = "$file2md5" ]
     then
         : # do nothing
     else
         rm -f /home/pi/start_picture_frame.sh
         cp /home/pi/configsync/start_picture_frame.sh /home/pi/start_picture_frame.sh
         chmod +x /home/pi/start_picture_frame.sh
     fi
fi

if test -f "/home/pi/configsync/rclocal_startup.sh"
then
     file1md5=$(md5sum < /home/pi/rclocal_startup.sh)
     file2md5=$(md5sum < /home/pi/configsync/rclocal_startup.sh)
     if [ "$file1md5" = "$file2md5" ]
     then
         : # do nothing
     else
         rm -f /home/pi/rclocal_startup.sh
         cp /home/pi/configsync/rclocal_startup.sh /home/pi/rclocal_startup.sh
         chmod +x /home/pi/rclocal_startup.sh
     fi
fi

if test -f "/home/pi/configsync/periodic_sync.sh"
then
     file1md5=$(md5sum < /home/pi/periodic_sync.sh)
     file2md5=$(md5sum < /home/pi/configsync/periodic_sync.sh)
     if [ "$file1md5" = "$file2md5" ]
     then
         : # do nothing
     else
         rm -f /home/pi/periodic_sync.sh
         cp /home/pi/configsync/periodic_sync.sh /home/pi/periodic_sync.sh
         chmod +x /home/pi/periodic_sync.sh
     fi
fi

if test -f "/home/pi/configsync/cron_frequent.sh"
then
     file1md5=$(md5sum < /home/pi/cron_frequent.sh)
     file2md5=$(md5sum < /home/pi/configsync/cron_frequent.sh)
     if [ "$file1md5" = "$file2md5" ]
     then
         : # do nothing
     else
         rm -f /home/pi/cron_frequent.sh
         cp /home/pi/configsync/cron_frequent.sh /home/pi/cron_frequent.sh
         chmod +x /home/pi/cron_frequent.sh
     fi
fi

if test -f "/home/pi/configsync/wpa_supplicant.conf"
then
     file1md5=$(md5sum < /etc/wpa_supplicant/wpa_supplicant.conf)
     file2md5=$(md5sum < /home/pi/configsync/wpa_supplicant.conf)
     if [ "$file1md5" = "$file2md5" ]
     then
         : # do nothing
     else
         sudo cat /home/pi/configsync/wpa_supplicant.conf > /etc/wpa_supplicant/wpa_supplicant.conf
     fi
fi

rclone sync farside:/picturesync /home/pi/picturesync
