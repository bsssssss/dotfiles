#!/bin/sh

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
    exit 0
fi

case "${PERCENTAGE}" in
100)
    if [[ "$CHARGING" != "" ]]; then
        ICON="󱈏"
    else
        ICON="󰁹"
    fi
    ;;
[9][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰂋"
    else
        ICON="󰂂"
    fi
    ;;
[8][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰢞"
    else
        ICON="󰂀"
    fi
    ;;
[7][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰢞"
    else
        ICON="󰂀"
    fi
    ;;
[6][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰂈"
    else
        ICON="󰁿"
    fi
    ;;
[5][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰢝"
    else
        ICON="󰁾"
    fi
    ;;
[4][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰂈"
    else
        ICON="󰁽"
    fi
    ;;
[3][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰂇"
    else
        ICON="󰁼"
    fi
    ;;
[1-2][0-9])
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰂆"
    else
        ICON="󰁻"
    fi
    ;;
*)
    if [[ "$CHARGING" != "" ]]; then
        ICON="󰢜"
    else
        ICON="󰁺"
    fi
    ;;
esac

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME"\
    icon="$ICON"\
    icon.font.size=16 \
    label="${PERCENTAGE}%"\
    label.padding_left=5
