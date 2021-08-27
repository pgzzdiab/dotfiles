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
 i3lock -e -i $pngfile
 rm $pngfile $bmpfile $pytHon_glitchedfile

# ---------------------------------------------------------------------------------
#!/bin/sh

# OVERLAY="/home/pierre/Pictures/castor_junior.jpeg"
# IMAGE="/tmp/lockbg.png"

# rm "$IMAGE"
# killall -q "i3lock"
# while pgrep -x i3lock >/dev/null; do sleep 1; done

# scrot "$IMAGE"
# convert "$IMAGE" -scale 5% -resize 2000% "$OVERLAY" -font "Hack" \
#     -pointsize 150 -draw "text 0,0 '~ session locked ~'" \
#     -gravity center -composite -matte "$IMAGE"

# BLANK='#00000000'
# CLEAR='#00000000'
# DEFAULT='#ffffff80'
# TEXT='#ffffff'
# WRONG='#ffa69ebb'
# VERIFYING='#ffd6a5'

# i3lock \
# --image="$IMAGE" \
