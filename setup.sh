echo -
echo add user to audio group
echo -
# add user to audio group
sudo gpasswd -a djay audio
sudo pacman -S alsa alsa-utils
echo -
echo lightdm install
echo -
# install and enable lightdm
sudo pacman -S lightdm lightdm-gtk-greeter
sudo systemctl enable lightdm
echo -
echo xorg install
echo -
# install xorg
sudo pacman -S xorg
echo -
echo i3 install
echo -
# install i3
sudo pacman i3-gaps i3blocks i3lock i3status
echo -
echo polybar install
echo -
# install polybar
git clone https://aur.archlinux.org/polybar.git
cd polybar
makepkg -s -i -r -c
cd ..
echo -
echo install other necessities
echo -
# install other necessities
sudo pacman -S dmenu picom nitrogen xfce4-terminal pcmanfm
echo -
echo install other
echo -
# install other
sudo pacman -S firefox archlinux-wallpaper neofetch emacs vim
echo -
echo copy config
echo -
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
