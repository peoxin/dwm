#!/usr/bin/env bash

amixer get Master | awk -F "[][]" '/Mono:/ {if ($6 == "on") print $2; else print "mute"}'
