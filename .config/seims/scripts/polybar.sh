#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bars
cd $HOME/.config/polybar
polybar -c config.ini main &
polybar -c config.ini left &
polybar -c config.ini right &

# Repair background
zsh ~/.fehbg

echo "Bars launched..."
