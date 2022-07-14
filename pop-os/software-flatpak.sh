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
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo apt update -y

PKGS=(

    'com.discordapp.Discord'
    'com.spotify.Client'
    'com.heroicgameslauncher.hgl'
    'net.davidotek.pupgui2'


)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    flatpak install -y "$PKG"
done

## correct problems
sudo dpkg --configure -a
sudo apt clean
sudo apt update -m
sudo apt install -f
sudo apt dist-upgrade
sudo apt autoremove --purge
sudo apt update && sudo apt upgrade -y

"
###############################################################################
# Done.
###############################################################################
"
