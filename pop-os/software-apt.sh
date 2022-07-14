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

    'curl'                                  # Remote content retrieval
    'gnome-tweaks'                          # Gnome tweaks
    'apt-transport-https'                   # apt-transport-https
    'htop'                                  # Process viewer
    'bpytop'                                # Process viewer
    'neofetch'                              # Shows system info when you launch terminal
    'p7zip'                                 # 7z compression program
    'rsync'                                 # Remote file sync utility
    'unrar'                                 # RAR compression program
    'unzip'                                 # Zip compression program
    'wget'                                  # Remote content retrieval
    'vim'                                   # Terminal Editor
    'zsh'                                   # ZSH shell
    'zsh-syntax-highlighting'               # Tab completion for ZSH
    'zsh-autosuggestions'                   # Tab completion for ZSH
    'fzf'                                   # Terminal finder

    # DISK UTILITIES ------------------------------------------------------

    'exfat-utils'           # Mount exFat drives
    'ntfs-3g'               # Open source implementation of NTFS file system
    'parted'                # Partition editor

    # GENERAL UTILITIES ---------------------------------------------------

    'cheese'                    # Webcam utilty
    'qbittorrent'               # Torrent


    # DEVELOPMENT ---------------------------------------------------------

    'gedit'                 # Text editor
    'gnuplot'               # Tool for plotting math equations and data set
    'cmake'                 # Cross-platform open-source make system
    'octave'                # FOSS version of Matlab
    'git'                   # Version control system
    'gcc'                   # C/C++ compiler
    'g++'                   # C/C++ compiler
    'glibc'                 # C libraries
    'python3'               # Python 3 interpreter
    'python3-pip'           # Python 3 package manager
    'git'                   # Version control system

    # MEDIA ---------------------------------------------------------------

    'simplescreenrecorder'  # Screen recorder
    'obs-studio'            # Advanced screen recorder
    'audacity'              # Audio editor
    'youtube-dl'            # Comand line tool for downloading yt videos
    'nomacs'                # Simple photo viewer and editor
    'vlc'                   # Video player
    'telegram-dekstop'      # Desktop version of Telegram
    'steam'                 # Steam game platform
    'lutris'                # Game platform

    # GRAPHICS AND DESIGN -------------------------------------------------

    'gcolor2'               # Colorpicker
    'gimp'                  # GNU Image Manipulation Program
    'ristretto'             # Multi image viewer
    'inkscape'              # Vectorial graphics
    'imagemagick'           # Image manipulation
    'okular'                # PDF viewer
    'calibre'               # Ebook reader
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
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
sudo apt install brave-browser -y

## VSCODE
echo "\nInstalling VSCode...\n"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get update
sudo apt-get install code -y
rm microsoft.gpg

## HEORIC GAME LAUNCHER
echo "\nInstalling Heoric Game Launcher...\n"

# Set fluent purple dark as icon theme on gnome
sudo gsettings set org.gnome.desktop.interface icon-theme "Fluent-purple-dark"
# Set Orchis-purple-dark-compact as WM theme on gnome
sudo gsettings set org.gnome.desktop.wm.preferences theme "Orchis-purple-dark-compact"
# Set zsh as default shell
sudo chsh -s /usr/bin/zsh
# Apply the confing files in the ../dots/kitty folder to the kitty config file
sudo cp -r ../dots/kitty/ ~/.config/kitty/
# set ../images/pop.png as the default wallpaper
sudo cp ../images/pop.png /usr/share/backgrounds/gnome/
# set ../images/mega_93685.png as the icon for the ~/MEGA folder
sudo cp ../images/mega_93685.png /usr/share/icons/hicolor/scalable/apps/mega.svg

# download the fonts and install them
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf -O ~/.local/share/fonts/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf -O ~/.local/share/fonts/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf -O ~/.local/share/fonts/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf -O ~/.local/share/fonts/MesloLGS%20NF%20Bold%20Italic.ttf

# set MesloLGS NF Regular as the default font for gnome terminal
gsettings set org.gnome.Terminal.Legacy.FontFace "MesloLGS NF Regular"

# set kitty as the default terminal
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator /usr/bin/kitty 60
sudo update-alternatives --set x-terminal-emulator /usr/bin/kitty

## correct problems
sudo dpkg --configure -a
sudo apt clean
sudo apt update -m
sudo apt install -f
sudo apt dist-upgrade
sudo apt autoremove --purge
sudo apt update && sudo apt upgrade -y
