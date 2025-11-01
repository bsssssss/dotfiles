#!/usr/bin/env bash

killall -q waybar

waybar &

inotifywait -m -e close_write,moved_to ~/.config/waybar/config.jsonc ~/.config/waybar/style.css |
while read -r directory event filename; do
    echo "Detected $event on $filename, reloading waybar..."
    killall -q waybar
    sleep 0.1
    waybar &
done

