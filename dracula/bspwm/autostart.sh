#!/bin/bash

sh ~/.fehbg

arr=("sxhkd" "xfce4-power-manager" "copyq" "fcitx5" "dunst" "xdman" "qv2ray" "redshift-gtk" "mpd" "compton" "conky" "~/.config/polybar/launch.sh")

for value in ${arr[@]}
do
    isExist=`ps -ef | grep "$value" | grep -v grep | wc -l`
    if [ $isExist == 0 ]
    then
        exec "$value" &
    fi
done
