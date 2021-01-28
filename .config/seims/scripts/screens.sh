#!/usr/bin/env bash
config=$(autorandr | cut -d"(" -f1 | rofi -dmenu -i -p config)
$(autorandr $config)
sh $HOME/.fehbg
sh $HOME/.config/seims/scripts/polybar.sh
echo "Screen configuration changed to $config"
