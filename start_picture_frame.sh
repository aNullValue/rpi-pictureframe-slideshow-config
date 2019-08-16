#!/bin/bash
DISPLAY=:0.0 XAUTHORITY=/home/pi/.Xauthority /usr/bin/feh --quiet --caption-path . --randomize --auto-zoom --fullscreen --reload 60 --hide-pointer --slideshow-delay 15.0 --auto-rotate /home/pi/picturesync
