#!/usr/bin/env bash

PLUGIN_DIR="$CONFIG_DIR/plugins"
source "$PLUGIN_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set $NAME \
        icon="●" \
        icon.color="$FG_COLOR"
else
    sketchybar --set $NAME \
        icon="○" \
        icon.color="$FG_COLOR"
fi
