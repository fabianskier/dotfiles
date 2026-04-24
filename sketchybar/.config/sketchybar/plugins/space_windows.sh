#!/bin/bash

get_label() {
  local sid="$1"
  local apps
  apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
  if [ -n "$apps" ]; then
    echo " · $(echo "$apps" | paste -sd' | ' -)"
  else
    echo ""
  fi
}

if [ "$SENDER" = "aerospace_monitor_change" ]; then
  sketchybar --set space."$FOCUSED_WORKSPACE" display="$TARGET_MONITOR"
  exit 0
fi

if [ "$SENDER" = "aerospace_workspace_change" ]; then
  sketchybar --set space.$PREV_WORKSPACE label="$(get_label "$PREV_WORKSPACE")"
else
  FOCUSED_WORKSPACE="$(aerospace list-workspaces --focused)"
fi

curr_label=$(get_label "$FOCUSED_WORKSPACE")
sketchybar --set space.$FOCUSED_WORKSPACE drawing=on label="$curr_label"

# Limpiar front_app si el workspace activo esta vacio
apps=$(aerospace list-windows --workspace "$FOCUSED_WORKSPACE" 2>/dev/null | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')
if [ -z "$apps" ]; then
  sketchybar --set front_app label=""
fi
