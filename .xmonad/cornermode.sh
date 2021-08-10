if grep -Fq "corner-radius = 10" /home/djay/.xmonad/picom.conf
then
	sed -i 's/corner-radius = 10/corner-radius = 0/' /home/djay/.xmonad/picom.conf
else
	sed -i 's/corner-radius = 0/corner-radius = 10/' /home/djay/.xmonad/picom.conf
fi
