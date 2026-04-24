#!/usr/bin/env bash

ACTIVE_BG=0xff89b4fa
ACTIVE_FG=0xff1e1e2e
SUBTEXT=0xff45475a

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
    background.drawing=on \
    background.color=$ACTIVE_BG \
    icon.color=$ACTIVE_FG
else
  sketchybar --set $NAME \
    background.drawing=off \
    icon.color=$SUBTEXT
fi
