#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

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

echo "Bars launched..."
