#!/bin/bash

blank='#00000000'  # blank
#background='#1A6785FF'
background='#1A5E81AC'
foreground='#D8DEE9FF'  # text

primary='#BF616AFF'  # default
alert='#EBCB8BFF'  # wrong
verifying='#A3BE8CFF'  # verifying

i3lock \
--image="/home/mir/Pictures/Background/wallpaper.png" \
\
--screen 1 \
--indicator \
--keylayout 2 \
--force-clock \
\
--insidevercolor=$background    \
--insidewrongcolor=$background  \
--insidecolor=$background       \
\
--ringvercolor=$primary         \
--ringwrongcolor=$alert         \
--ringcolor=$primary            \
\
--linecolor=$primary            \
--line-uses-inside \
\
--keyhlcolor=$alert             \
--bshlcolor=$alert              \
\
--separatorcolor=$primary       \
\
--verifcolor=$foreground        \
--wrongcolor=$foreground        \
--timecolor=$foreground \
--datecolor=$foreground         \
--layoutcolor=$foreground       \
\
--time-align=0 \
--date-align=0 \
--layout-align=0 \
--verif-align=0 \
--wrong-align=0 \
--modif-align=0 \
\
--blur 5              \
--indicator           \
--keylayout 2         \
\
--veriftext=""          \
--wrongtext=""          \
# --clock               \
# --timestr="%H:%M:%S"  \
# --line-uses-inside       \
# --datestr="%A, %m %Y" \
# --textsize=20
# --modsize=10
#--time-font=noto-sans    \
#--datefont=noto-sans    \
# etc

