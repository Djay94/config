DIR="$HOME/Pictures/wallpapers"
PIC=$(ls $DIR | shuf -n1)
nitrogen --set-zoom-fill $HOME/Pictures/wallpapers/$PIC
killall picom
picom --config /home/djay/.xmonad/picom.conf
