#!/bin/sh

if [ "$(tmux display-message -p -F "#{session_name}")" = "popup" ]; then
  tmux detach-client
else
  tmux popup -E "tmux new -Ads popup"
fi
