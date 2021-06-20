# Arch Linux

This script is for Arch linux and any of its derivative (Garuda, Manjaro ...). It is strongly inspired by the ArchMatic repo by Chris Titus, go check it out: https://github.com/ChrisTitusTech/ArchMatic

Before running the script you need an AUR helper, I use Paru. To install open the terminal and run 

```bash
cd "${HOME}"
sudo pacman -S --needed base-devel git
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd "${HOME}"
```

After this you need to clone the repo 

```bash
git clone https://github.com/lukefleed/LinuxScript
cd LinuxScript/arch
sudo chmod +x software.sh
```
To run the scrip (in the same folder as before) 

```bash
sudo ./software.sh
```
## ZSH
I also use ZSH with a nice Dracula theme, the script installs everything that you need. To set ZSH as default shell 

```bash
chsh $USER
```
then type `/bin/zsh`. You may need to restart the shell or log in a new session to see the effects 


## IMPORTANT!

You must read the script before running it. I strongly suggest you to fork (or just clone) the repo and make you own changes: adapt it to your own preferences.