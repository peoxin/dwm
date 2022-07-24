#!/usr/bin/env bash

# Edit them according to your devices
mic_state=`amixer get Capture | awk -F "[][]" '/Left:/ {print $6}'`
if [ ${mic_state} = "on" ]; then
    amixer set Capture nocap
else
    amixer set Capture cap
fi
