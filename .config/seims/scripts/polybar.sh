#!/usr/bin/env bash

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload main &
done

zsh ~/.fehbg

xinput set-prop "$TOUCHPAD" "libinput Tapping Enabled" 1
xinput set-prop "$TOUCHPAD" "libinput Natural Scrolling Enabled" 1
