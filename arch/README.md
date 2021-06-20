# Arch Linux

This script is for Arch linux and any of its derivative (Garuda, Manjaro ...). Before running the script you need an AUR helper, I use Paru. To install open the terminal and run 

'''
cd "${HOME}"
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd "${HOME}"
'''

After this you need to clone the repo 

'''
git clone https://github.com/lukefleed/LinuxScript
cd LinuxScript/arch
sudo chmod +x software.sh
'''
To run the scrip (in the same folder as before) 

'''
sudo ./software.sh
'''