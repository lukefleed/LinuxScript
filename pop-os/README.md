# Pop!_OS

This script is for Ubuntu and all of its derivative (PopOS, Linux Mint ...). It is strongly inspired by the ArchMatic repo by Chris Titus, go check it out: https://github.com/ChrisTitusTech/ArchMatic

Tu run the script

```bash
git clone https://github.com/lukefleed/LinuxScript
cd LinuxScript/pop-os
./software-apt.sh
./sotware-flatpak.sh
```
Since we are in Ubuntu we have to deal with the absence of the AUR, the secondo script install via **flatpak** all the usefull programs that are not installable via apt


## ZSH
I also use ZSH with a nice Dracula theme, the script installs everything that you need. To set ZSH as default shell 

```bash
chsh $USER
```
then type `/bin/zsh`. You may need to restart the shell or log in a new session to see the effects. After this, copy to your `home` directory the files `.zshrc` and `.p10k.zsh`


## IMPORTANT!

You must read the script before running it. I strongly suggest you to fork (or just clone) the repo and make you own changes: adapt it to your own preferences.