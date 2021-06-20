#!/usr/bin/env bash

#Do not run this script without reading and understanding it befere. Comment or delete every package that you dont'need

## This script is based on the ArchMatic repository of Chris Titus: https://github.com/ChrisTitusTech/ArchMatic

# 32bit
sudo dpkg --add-architecture i386


echo "
###############################################################################
# Installing software... 
###############################################################################
"

PKGS=(

    # TERMINAL UTILITIES --------------------------------------------------

    'bleachbit'                             # File deletion utility
    'curl'                                  # Remote content retrieval 
    'gnome-tweak-tool'
    'gnome-shell-extensions'
    'chrome-gnome-shell'
    'apt-transport-https'
    'htop'                                  # Process viewer
    'neofetch'                              # Shows system info when you launch terminal
    
    
    'openssh'                               # SSH connectivity tools
    'p7zip'                                 # 7z compression program
    'rsync'                                 # Remote file sync utility
         
    'tlp'                                   # Advanced laptop power management
    'unrar'                                 # RAR compression program
    'unzip'                                 # Zip compression program
    'wget'                                  # Remote content retrieval
    'kitty'                                 # Terminal emulator
    'vim'                                   # Terminal Editor
    'zip'                                   # Zip compression program
    'zsh'                                   # ZSH shell

    'zsh-syntax-highlighting'               # Tab completion for ZSH
    'zsh-autosuggestions'                   # Tab completion for ZSH
    'zsh-theme-powerlevel10k'               # Theme for zsh
   
    'fzf'                                   # Terminal finder


    # DISK UTILITIES ------------------------------------------------------

    
    'exfat-utils'           # Mount exFat drives
    'gparted'               # Disk utility
    'ntfs-3g'               # Open source implementation of NTFS file system
    

    # GENERAL UTILITIES ---------------------------------------------------

    'firefox'                   # Web Browser
    'cheese'                    # Webcam utilty
    'qbittorrent'               # Torrent

    # DEVELOPMENT ---------------------------------------------------------

    'gedit'                 # Text editor
    'gnuplot'               # Tool for plotting math equations and data set
    'cmake'                 # Cross-platform open-source make system
    'octave'                # FOSS version of Matlab
    'git'                   # Version control system
    'gcc'                   # C/C++ compiler
    'glibc'                 # C libraries
    'nodejs'                # Javascript runtime environment
    'npm'                   # Node package manager
    'python'                # Scripting language
    'ninja-build'
    'libdbus-1-dev'
    'gnupg'
    'meson'
    
    # MEDIA ---------------------------------------------------------------

    'simplescreenrecorder'  # Screen recorder
    'obs-studio'            # Advanced screen recorder
    'audacity'
    'youtube-dl'            # Comand line tool for downloading yt videos
    'nomacs'                # Simple photo viewer and editor
    'vlc'                   # Video player
    
    # GRAPHICS AND DESIGN -------------------------------------------------

    'gcolor2'               # Colorpicker
    'gimp'                  # GNU Image Manipulation Program
    'ristretto'             # Multi image viewer
    'inkscape'              # Vectorial graphics
    'imagemagick'

    
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo apt install -y "$PKG" 
done

echo "
###############################################################################
# Done. Starting with no APT packages
###############################################################################
"
## Brave
echo "\nInstalling Brave...\n"

curl -s https://brave-browser-apt-beta.s3.brave.com/brave-core-nightly.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-prerelease.gpg add -
echo "deb [arch=amd64] https://brave-browser-apt-beta.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-beta.list
sudo apt update
sudo apt install brave-browser-beta -y


echo "\nInstalling Tor...\n"
## Tor
sudo add-apt-repository ppa:micahflee/ppa && sudo apt update
sudo apt install torbrowser-launcher -y

#Wine and Lutris
echo "\nInstalling Wine and Lutris...\n"
sudo add-apt-repository 'deb https://dl.winehq.org/wine-builds/ubuntu/ focal main' -y
sudo add-apt-repository ppa:lutris-team/lutris -y
sudo apt update
sudo apt-get install --install-recommends winehq-staging -y
sudo apt-get install libgnutls30:i386 libldap-2.4-2:i386 libgpg-error0:i386 libxml2:i386 libasound2-plugins:i386 libsdl2-2.0-0:i386 libfreetype6:i386 libdbus-1-3:i386 libsqlite3-0:i386 -y
sudo apt-get install lutris -y

echo "\nInstalling Proton...\n"
#proton
cd ~
wget https://raw.githubusercontent.com/Termuellinator/ProtonUpdater/master/cproton.sh
sudo chmod +x cproton.sh
./cproton.sh
cd $HOME

echo "\nInstalling legendary...\n"
#legendary
git clone https://github.com/derrod/legendary.git
cd legendary
sudo python3 setup.py install
cd $HOME

echo "\nInstalling VScode...\n"
## VSCODE
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https
sudo apt-get update
sudo apt-get install code

## correct problems
sudo dpkg --configure -a
sudo apt clean
sudo apt update -m
sudo apt install -f
sudo apt dist-upgrade
sudo apt autoremove --purge
sudo apt update && sudo apt upgrade -y