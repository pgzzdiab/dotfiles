#!/usr/bin/env bash
tmpbg="/tmp/screen.png"
# scrot "$tmpbg"; ~/tools/corrupter/corrupter -add 5 -bheight 5 -boffset 5 -lag 0.010 -mag 1 "$tmpbg" "$tmpbg"
# convert -gravity center -font "Fira" \
#      -pointsize 50 -draw "text 0,0 'Type password to unlock'" -gravity South -channel RGBA $tmpbg $tmpbg
# i3lock -i "$tmpbg" -u -f
# rm "$tmpbg"

# scrot "$tmpbg"
# convert -channel RGBA $tmpbg $tmpbg
# i3lock -i "$tmpbg" -u -f
current_res=$(xrandr | grep \* | cut -d' ' -f4)
echo $current_res

convert -channel RGBA -resize $current_res ~/Pictures/lock.png $tmpbg
i3lock -i "$tmpbg" -f
rm "$tmpbg"
