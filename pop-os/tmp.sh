#!/usr/bin/env bash

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
    'gnome-shell-extensions'
    'chrome-gnome-shell'
    'apt-transport-https'
    'htop'                                  # Process viewer
    'neofetch'                              # Shows system info when you launch terminal
    'unrar'                                 # RAR compression program
    'unzip'                                 # Zip compression program
    'wget'                                  # Remote content retrieval
    'vim'                                   # Terminal Editor
    'fzf'                                   # Terminal finder

    # DISK UTILITIES ------------------------------------------------------

    'exfat-utils'           # Mount exFat drives
    'ntfs-3g'               # Open source implementation of NTFS file system

    # GENERAL UTILITIES ---------------------------------------------------

    'cheese'                    # Webcam utilty

    # DEVELOPMENT ---------------------------------------------------------

    'gedit'                 # Text editor
    'gnuplot'               # Tool for plotting math equations and data set
    'cmake'                 # Cross-platform open-source make system
    'octave'                # FOSS version of Matlab
    'git'                   # Version control system
    'npm'                   # Node package manager
    'ninja-build'
    'libdbus-1-dev'
    'gnupg'
    'meson'

    # MEDIA ---------------------------------------------------------------

    'simplescreenrecorder'  # Screen recorder
    'obs-studio'            # Advanced screen recorder
    'nomacs'                # Simple photo viewer and editor
    'vlc'                   # Video player

    # GRAPHICS AND DESIGN -------------------------------------------------

    'ristretto'             # Multi image viewer
    'imagemagick'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo apt install -y "$PKG"
done

echo "
###############################################################################
# Done.
###############################################################################
"

## correct problems
sudo dpkg --configure -a
sudo apt clean
sudo apt update -m
sudo apt install -f
sudo apt dist-upgrade
sudo apt autoremove --purge
sudo apt update && sudo apt upgrade -y
