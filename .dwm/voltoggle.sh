#!/usr/bin/env bash

# Edit them according to your devices
vol_state = amixer get Master | awk -F "[][]" '/Left:/ {print $6}'
if [ vol_state -eq "on" ]; then
	amixer set Master toggle
elif
	amixer set Master toggle
	amixer set PCM toggle
fi	
