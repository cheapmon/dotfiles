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

for FILE in $(fd -tf . $HOME/.dots | awk "{ gsub(\"$HOME/.dots\", \"\"); print }"); do
  ORIGIN="$HOME/.dots$FILE"
  echo "cp $ORIGIN $FILE"
  cp $ORIGIN $FILE
done
