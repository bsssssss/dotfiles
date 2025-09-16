#!/usr/bin/env bash

# The $SELECTED variable is available for space components and indicates if
# the space invoking this script (with name: $NAME) is currently selected:
# https://felixkratz.github.io/SketchyBar/config/components#space----associate-mission-control-spaces-with-an-item

PLUGIN_DIR="$CONFIG_DIR/plugins"
source "$PLUGIN_DIR/colors.sh"

if [[ "$SELECTED" == true ]]; then
  sketchybar --set $NAME \
    icon.color="$FG_COLOR" \
    icon.font.style="Bold" 
else
  sketchybar --set $NAME \
    icon.color="$FG_COLOR_DIMMED" \
    icon.font.style="Regular" 
fi
