#!/usr/bin/env sh
killall -q polybar
# while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

MONITOR="HDMI1" polybar -c ~/.config/polybar/config.ini example &
# MONITOR="eDP1" polybar -c ~/.config/polybar/config.ini background.edp.2 &
