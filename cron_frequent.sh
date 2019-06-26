#!/bin/bash
currenttime=$(date +%H:%M)
if [[ "$currenttime" > "21:00" ]] || [[ "$currenttime" < "06:30" ]]; then
     # monitor should be off
     vcgencmd display_power 0
else
     # monitor should be on
     vcgencmd display_power 1
fi
