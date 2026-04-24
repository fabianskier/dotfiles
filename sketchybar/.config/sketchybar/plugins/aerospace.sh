#!/usr/bin/env bash

ACTIVE_BG=0xff89b4fa
ACTIVE_FG=0xff1e1e2e
SUBTEXT=0xffbac2de

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME \
    background.color=$ACTIVE_BG \
    icon.color=$ACTIVE_FG
else
  sketchybar --set $NAME \
    background.color=0x00000000 \
    icon.color=$SUBTEXT
fi
