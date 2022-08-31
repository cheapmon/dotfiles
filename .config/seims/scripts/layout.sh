#!/usr/bin/env bash

i3-msg "workspace --no-auto-back-and-forth 1"
i3-msg "append_layout $HOME/.i3/workspace-1.json"
i3-msg "exec alacritty"
i3-msg "exec alacritty"
i3-msg "exec alacritty"
