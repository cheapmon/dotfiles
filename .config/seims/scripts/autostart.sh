#!/usr/bin/env bash

HOUR=$(($(date +%H)))

if [ "$WORK" == "yes" -a $HOUR -ge 8 -a $HOUR -lt 18 ]; then
  firefox-developer-edition &
  thunderbird &
  slack &
  element-desktop &
  telegram-desktop &
  signal-desktop &
  spotify &
fi
