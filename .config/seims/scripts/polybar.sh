#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Setup modules based on WM
export MODULES_MAIN="round-left i3 round-right margin round-left xwindow round-right margin round-left spotify round-right"
export MODULES_RIGHT="round-left i3 round-right margin round-left xwindow round-right"

# Launch bars
cd $HOME/.config/polybar
if [ -n "$MONITOR" ]; then
  polybar -c config.ini main &
fi
if [ -n "$MONITOR_LEFT" ]; then
  polybar -c config.ini left &
fi
if [ -n "$MONITOR_RIGHT" ]; then
  polybar -c config.ini right &
fi

# Repair background
zsh ~/.fehbg

# xinput
xinput set-prop "$TOUCHPAD" "libinput Tapping Enabled" 1
xinput set-prop "$TOUCHPAD" "libinput Natural Scrolling Enabled" 1

echo "Bars launched..."
