#!/bin/bash
# script to change the layout to monocle if there is only one window on the
# desktop

while true; do
  W=$(bspc query -N -n .window -d focused | wc -l)
  if [[ "$W" == 1 ]]; then
    bspc desktop --layout monocle
  else
    bspc desktop --layout tiled
  fi
done
