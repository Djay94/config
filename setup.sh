# add user to audio group
sudo gpasswd -a djay audio
sudo pacman -S alsa alsa-utils

# install and enable lightdm
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm

# install xorg
sudo pacman -S xorg

# install i3
sudo pacman i3-gaps i3blocks i3lock i3status

# install polybar
git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -s -i -r -c
cd ..

# install i3 necessities
sudo pacman -S dmenu picom nitrogen

# install other
sudo pacman -S firefox archlinux-wallpaper neofetch emacs vim xfce4-terminal alacritty pcmanfm ark audacity blender make discord gimp htop mousepad obs-studio qbittorrent vlc

# copy config files
cp -r i3 ~/.config
cp -r nitrogen ~/.config
cd ~/.config
mkdir polybar
cd ~/config
cp config ~/.config/polybar
chmod +x launch.sh
cp launch.sh ~/.config/polybar
cp picom.conf ~/.config
