# Copy Configs
mv -vf ./.config/* ~/.config/
mv -vf ./home/* ~/
mv -vf ./home/.* ~/

# Download ungoogled chromium key
curl -s 'https://download.opensuse.org/repositories/home:/ungoogled_chromium/Arch/x86_64/home_ungoogled_chromium_Arch.key' | sudo pacman-key -a -

# Replace pacman.conf to enable ungoogled chromium and multilib
sudo mv -fv ./pacman.conf /etc/pacman.conf

# Download spotify key
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | gpg --import

# Install packages
sudo pacman -Syyu
sudo pacman -S amd-ucode audacity blender cmake discord dunst ed edk2-ovmf feh firefox flameshot gedit gimp git glava htop kitty linux-headers make mpv micro nasm neofetch nitrogen obs-studio qbittorrent qemu qemu-arch-extra ranger rofi sfml steam thunar torbrowser-launcher ungoogled-chromium unzip vim virt-manager virtualbox wget wine xmonad xmonad-contrib xmonad-utils xorg youtube-dl zip zsh mesa base-devel

# Install aur packages
mkdir temp
cd temp
git clone https://aur.archlinux.org/pfetch.git
cd pfetch
makepkg -sirc
cd ..
git clone https://aur.archlinux.org/picom-jonaburg-git.git
cd picom-jonaburg-git
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
git clone https://aur.archlinux.org/nerd-fonts-fira-code.git
cd nerd-fonts-fira-code.git
makepkg -sirc
cd ..

# Delete git cloned folders
cd ..
rm -vrf temp

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install powerlevel10k
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

# Install zsh auto suggestions
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

# Install zsh syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# Install ranger dev icons
git clone https://github.com/alexanderjeurissen/ranger_devicons ~/.config/ranger/plugins/ranger_devicons
echo "default_linemode devicons" >> $HOME/.config/ranger/rc.conf

# Install vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
