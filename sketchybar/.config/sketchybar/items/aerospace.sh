sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        label.drawing=off \
        background.drawing=off \
        icon.font.size=18 \
        icon.y_offset=1 \
        icon.padding_right=20 \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done
