#rm -r ~/Pictures
#mv ./.config/* ~/.config/
#mv ./home/* ~/

curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -
sudo mv -fv ./pacman.conf /etc/pacman.conf

sudo pacman -Syyu amd-ucode audacity blender cmake discord dunst ed edk2-ovmf feh firefox flameshot gedit gimp git glava htop kitty linux-headers make mpv nano nasm neofetch nitrogen obs-studio qbittorrent qemu qemu-arch-extra ranger rofi sddm sfml steam thunar torbrowser-launcher ungoogled-chromium unzip vim virt-manager virtualbox wget wine xmonad xmonad-contrib xmonad-utils xorg youtube-dl zip zsh alsa alsa-utils pulseaudio pulseaudio-alsa mesa

mkdir temp
cd temp
git clone https://aur.archlinux.org/pfetch.git
cd pfetch
makepkg -sirc
cd ..
git clone https://aur.archlinux.org/picom-jonaburg-git.git
cd picom-johnburg-git
makepkg -sirc
cd ..
git clone https://aur.archlinux.org/ttf-ms-fonts.git
cd ttf-ms-fonts
makepkg -sirc
cd ..
git clone https://aur.archlinux.org/visual-studio-code-bin.git
cd visual-studio-code-bin
makepkg -sirc
cd ..
git clone https://aur.archlinux.org/lyrebird.git
cd lyrebird
makepkg -sirc
cd ..
git clone https://aur.archlinux.org/minecraft-launcher.git
cd minecraft-launcher
makepkg -sirc
cd ..
git clone https://aur.archlinux.org/spotify.git
cd spotify
makepkg -sirc
cd ..


cd ..
rm -vr temp
