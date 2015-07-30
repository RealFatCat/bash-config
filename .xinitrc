#!/bin/sh
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# For trackpoint:
xinput set-prop "AlpsPS/2 ALPS DualPoint Stick" "Evdev Wheel Emulation" 1
xinput set-prop "AlpsPS/2 ALPS DualPoint Stick" "Evdev Wheel Emulation Button" 2
xinput set-prop "AlpsPS/2 ALPS DualPoint Stick" "Evdev Wheel Emulation Timeout" 200
xinput set-prop "AlpsPS/2 ALPS DualPoint Stick" "Evdev Wheel Emulation Axes" 6 7 4 5
xinput set-prop "AlpsPS/2 ALPS DualPoint Stick" "Device Accel Constant Deceleration" 0.75

#syndaemon -i 0.3 -d 		# turned off touchpad
setxkbmap -option terminate:ctrl_alt_bksp
setxkbmap -layout us,ru -option "grp:alt_shift_toggle" -variant ",winkeys"
exec i3
