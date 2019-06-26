# rpi-slideshow-config
My crappy little config to have an rpi 3b act as a "picture frame"

## What

this is woefully insecure. i don't recommend using it. use at your own risk. etc. etc. i've spent like 5 minutes on this.

these are my notes-to-self as to how i got this rpi working as a picture frame, that would self-update from a gdrive file share

last performed 2019-06-26

rpi 3b

Dell UltraSharp LCD

HDMI -> DVI adapter

## Instructions

0a. set up an account on a web file sharing doohickey like google drive.

0b. create folders "picturesync" and "configsync" and note where in the path you put them.

0c. put all of the files from this repo in the "configsync" folder.

0c. edit wpa_supplicant.conf to ensure that it's correct for you (it's not by default). refer to wpa_supplicant on a real working rpi3b to get a feel for what it should be like. or google it, i'm not your boss, i'm you.

0d. of course you should also review the rest of the files for accuracy because lord only knows what typos there might be

0e. adjust "cron_frequent.sh" so that your preferred times are used for when the display should be put to sleep

1. download noobs

2. follow the instructions on the rpi official website to get noobs running

3.
```bash
sudo nano /etc/lightdm/lightdm.conf
```

Now in here add the following line anywhere beneath the [SeatsDefaults] line.

```
xserver-command=X -s 0
```

4.
```bash
sudo nano /etc/rc.local
```

Add just before exit 0:
```bash
bash /home/pi/rclocal_startup.sh &
```

5.
```bash
sudo apt-get install feh
curl https://rclone.org/install.sh | sudo bash
rclone configure # Use the knowledge you obtained during step 0 to properly configure rclone. in this doc the remote is called "remoteside"
mkdir /home/pi/picturesync
mkdir /home/pi/configsync
rclone sync remoteside:/configsync /home/pi/configsync
cp /home/pi/configsync/periodic_sync.sh /home/pi/periodic_sync.sh
chmod +x /home/pi/periodic_sync.sh
sudo /home/pi/periodic_sync.sh
sudo su -
mkdir /root/.config
mkdir /root/.config/rclone
cp /home/pi/.config/rclone/rclone.conf /root/.config/rclone/rclone.conf
```

6.
```bash
crontab -e
```

Add these lines:

```
0/15 * * * * sudo /home/pi/periodic_sync.sh
* * * * * /home/pi/cron_frequent.sh
```

7.
```bash
sudo /home/pi/periodic_sync.sh
reboot
```


