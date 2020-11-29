#!/bin/bash

for line in `cat ~/.config/bspwm/flag`
do
    if [ $line == '0' ]
    then
        sxhkd &
        setxkbmap -option "ctrl:swapcaps"
        picom -b
        sh ~/.config/bspwm/bin/bspbar
        sh ~/.fehbg
        fcitx5 &
        xdman &
        dunst &
        xautolock -time 10 -locker '/usr/bin/betterlockscreen -l' -corners ---- -cornersize 30 &
        xsetroot -cursor_name left_ptr
        wmname LG3D
        python3 /usr/bin/redshift-gtk &
        copyq &
        xfce4-power-manager &
        qv2ray &
        nutstore &
        echo '1' > $HOME/.config/bspwm/flag
    fi
done

sxhkd &
setxkbmap -option "ctrl:swapcaps"
picom --config ~/.config/picom/picom.conf -b
sh ~/.config/bspwm/bin/bspbar
sh ~/.fehbg
fcitx5 &
xdman &
dunst &
xautolock -time 10 -locker '/usr/bin/betterlockscreen -l' -corners ---- -cornersize 30 &
xsetroot -cursor_name left_ptr
wmname LG3D
python3 /usr/bin/redshift-gtk &
copyq &
xfce4-power-manager &
qv2ray &
nutstore &
