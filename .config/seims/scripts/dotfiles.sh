#!/usr/bin/env zsh
if [[ $1 == "-g" ]]; then
  FILES=$(fd -tf . $HOME/.dots | awk "{ gsub(\"$HOME/.dots\", \"\"); print }" | xargs)
  echo "sudo groupadd -f dots"
  echo "sudo usermod -aG dots $USER"
  for FILE in $(echo "$FILES" | xargs); do
    echo "sudo mkdir -p $(dirname $FILE)"
  done
  echo "sudo touch $FILES"
  echo "sudo chgrp dots $FILES"
  echo "sudo chmod g+rw $FILES"
  exit
fi

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

i3-msg restart
dunstify -a $APP_NAME -u $URGENCY $MESSAGE

for FILE in $(fd -tf . $HOME/.dots | awk "{ gsub(\"$HOME/.dots\", \"\"); print }"); do
  ORIGIN="$HOME/.dots$FILE"
  echo "cp $ORIGIN $FILE"
  cp $ORIGIN $FILE
done
