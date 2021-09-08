#!/bin/sh

# glitchy lock script, source:
# https://github.com/x-zvf/dotfiles/blob/master/scripts/scrlock.sh

lockimage="~/Pictures/castor_junior.jpeg"
pngfile="/tmp/sclock.png"
bmpfile="/tmp/sclock.bmp"
glitchedfile="/tmp/sclock_g.bmp"
python_glitchedfile="/tmp/sclock_g.png"
python_matte_glitchedfile="/tmp/sclock_g.png"

scrot -z $pngfile

# convert to bmp and pixelate
# magick convert -scale 20% -scale 500% $pngfile $bmpfile
convert -scale 20% -scale 500% $pngfile $bmpfile

# glitch_this $pngfile -c -s 4 -sd 600 -f -o $python_glitchedfile

convert $pngfile -blur 0x8 $python_glitchedfile

convert -gravity center -font "terminus" \
     -pointsize 50 -draw "text 0,0 '<Type password to unlock>'" -gravity South -channel RGBA -fill '#ffffff' $python_glitchedfile $pngfile

# -u disables circle indicator when entering characters
# -e doesn't try to authenticate when no character is entered
i3lock -e --indicator --clock -i $pngfile

# i3lock --blur $blur \
# 	   --verifsize=16 \
# 	   --veriftext="..." \
# 	   --radius $radius \
# 	   --ring-width $width \
# 	   --indicator --clock \
# 	   --timesize=$timesize \
# 	   --datesize=$datesize \
# 	   --timestr="%I:%M" \
# 	   --datestr="%B %d, %Y" \
# 	   --linecolor=$blank \
# 	   --insidecolor=$ic --ringcolor=$rc \
# 	   --datecolor=$tc --timecolor=$tc \
# 	   --separatorcolor=$rc --keyhlcolor=${khl#\#} \
# 	   --bshlcolor=${bshl#\#} \
# 	   --verifcolor=$tc --wrongcolor=$tc \
# 	   --ringvercolor=${rvc:-$rc} --ringwrongcolor=$wc \
# 	   --insidevercolor=$ic --insidewrongcolor=$ic \

rm $pngfile $bmpfile $pytHon_glitchedfile

