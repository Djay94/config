# add user to audio group
sudo gpasswd -a djay audio
sudo pacman -S alsa alsa-utils

# install and enable lightdm
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm

# install xorg and xmonad
sudo pacman -S xorg

# install i3
sudo pacman i3-gaps i3bloacks i3lock i3status

# install polybar
git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -s -i -r -c

# install other necessities
sudo pacman -S dmenu picom nitrogen xfce4-terminal pcmanfm

# install other
sudo pacman -S firefox archlinux-wallpaper neofetch emacs

# copy config files
cp -r i3 ~/.config
cp -r nitrogen ~/.config
cp -r polybar ~/.config
