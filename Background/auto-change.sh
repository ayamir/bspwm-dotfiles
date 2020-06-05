#!/bin/sh  
while true; do  
  arr=(`find /home/mir/Pictures/Background -type f \( -name '*.jpg' -o -name '*.png' \)|shuf -n2`)  
  bg0=${arr[0]}  
  #feh --bg-fill $bg0 --bg-fill $bg1  
  feh --bg-scale $bg0 --bg-scale $bg1  
  sleep 30m  
done
