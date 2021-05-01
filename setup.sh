# add user to audio group
sudo gpasswd -a djay audio
sudo pacman -S alsa alsa-utils

# install and enable lightdm
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm

# install xorg and xmonad
sudo pacman -S xorg xmonad xmonad-contrib xmobar

# install other necessities
sudo pacman -S dmenu picom nitrogen termite pcmanfm

# install other
sudo pacman -S chromium archlinux-wallpaper

# copy config files
cp .xprofile ~/
cp -r .xmonad ~/
