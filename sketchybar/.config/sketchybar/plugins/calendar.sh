#!/usr/bin/env bash

sketchybar --set $NAME label="$(LC_ALL=fr_FR.UTF-8 date +'%A %d %B')" \
    label.padding_left=10
