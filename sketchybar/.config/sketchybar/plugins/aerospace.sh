#!/usr/bin/env bash

PLUGIN_DIR="$CONFIG_DIR/plugins"
source "$PLUGIN_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
        label.color="$FG_COLOR" \
        label.font.style="Bold"
else
    sketchybar --set $NAME \
        label.color="$FG_COLOR_DIMMED" \
        label.font.style="Regular"

fi
