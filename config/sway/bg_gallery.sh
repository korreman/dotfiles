#!/usr/bin/env bash

sleep_time=3600
wallpaper_path=~/pictures/wallpapers/
sleep 2
while true
do
    files=$(ls -1 $wallpaper_path | shuf);
    for f in $files
    do
        echo "Switching to background $f...";
        swaymsg "output * bg $wallpaper_path$f fill"
        sleep $sleep_time;
    done
done
