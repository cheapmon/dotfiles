#!/usr/bin/env bash

if [ "$WORK" == "yes" ]; then
  firefox-developer-edition &
  thunderbird &
  slack &
  element-desktop &
  spotify &
fi
