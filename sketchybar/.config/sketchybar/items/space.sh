#!/usr/bin/env bash

PLUGIN_DIR="$CONFIG_DIR/plugins"

SPACE_ICONS=("1" "2" "3" "4")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$(($i+1))"
  space=(
    space="$sid"
    icon="${SPACE_ICONS[i]}"
    icon.padding_left=8
    icon.padding_right=8
    label.drawing=off
    script="$PLUGIN_DIR/space.sh"
    click_script="yabai -m space --focus $sid"
  )
  sketchybar --add space space."$sid" left --set space."$sid" "${space[@]}"
done
