# add user to audio group
sudo gpasswd -a djay audio
sudo pacman -S alsa alsa-utils

# install xmonad and other
sudo pacman -S xorg xmonad xmonad-contrib xmobar dmenu picom nitrogen chromium terminator

cp .xprofile ~/
cp .xmonad ~/
