#!/usr/bin/env bash

i3-msg "workspace --no-auto-back-and-forth $1"
i3-msg "append_layout $HOME/.i3/workspace-$2.json"
i3-msg "exec alacritty --working-directory=$HOME/git/architecture/apps/$3"
i3-msg "exec alacritty --working-directory=$HOME/git/architecture/apps/$3"
i3-msg "exec alacritty --working-directory=$HOME/git/architecture/apps/$3"
