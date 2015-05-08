#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

syndaemon -i 0.3 -d
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -layout us,ru -option "grp:alt_shift_toggle" -variant ",winkeys"
exec i3
