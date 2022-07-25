#!/usr/bin/env bash

# Monitor settings
xrandr --output eDP-1 --mode 2160x1440

# Wallpaper
feh --bg-scale  ~/Pictures/wallpaper.jpg

# Picom
exec picom --config ~/.config/picom/picom.conf &

# Run slstatus
exec slstatus &

# Run clash
exec cfw &

# Run fcitx5
exec fcitx5 &
