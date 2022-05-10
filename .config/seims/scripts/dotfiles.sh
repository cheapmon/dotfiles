#!/usr/bin/env zsh
APP_NAME="dotfiles"

source $HOME/.zshrc
dt pull --all

case $? in
  0)
    MESSAGE=$(dt log -1 --pretty=%B)
    URGENCY="normal"
    ;;
  *)
    MESSAGE="something went wrong"
    URGENCY="critical"
    ;;
esac

dunstify -a $APP_NAME -u $URGENCY $MESSAGE
