#!/usr/bin/env bash

#Do not run this script without reading and understanding it befere. Comment or delete every package that you dont'need

## This script is based on the ArchMatic repository of Chris Titus: https://github.com/ChrisTitusTech/ArchMatic

echo "
###############################################################################
# Installing software... 
###############################################################################
"

PKGS=(

    # --- Networking Setup
    'wpa_supplicant'            # Key negotiation for WPA wireless networks
    'dialog'                    # Enables shell scripts to trigger dialog boxex
    'openvpn'                   # Open VPN support
    'networkmanager-openvpn'    # Open VPN plugin for NM
    'network-manager-applet'    # System tray icon/utility for network connectivity
    'libsecret'                 # Library for storing passwords

    # --- Audio
    'alsa-utils'        # Advanced Linux Sound Architecture (ALSA)
    'alsa-plugins'      # ALSA plugins
    'pulseaudio'        # Pulse Audio sound components
    'pulseaudio-alsa'   # ALSA configuration for pulse audio
    'pavucontrol'       # Pulse Audio volume control
    'pnmixer'           # System tray volume control

    # --- Bluetooth
    'bluez'                 # Daemons for the bluetooth protocol stack
    'bluez-utils'           # Bluetooth development and debugging utilities
    'bluez-firmware'        # Firmwares for Broadcom BCM203x and STLC2300 Bluetooth chips
    'blueberry'             # Bluetooth configuration tool
    'pulseaudio-bluetooth'  # Bluetooth support for PulseAudio

    # TERMINAL UTILITIES --------------------------------------------------

    'bash-completion'                       # Tab completion for Bash
    'bleachbit'                             # File deletion utility
    'curl'                                  # Remote content retrieval 
    'bpytop'                                # System monitoring via terminal
    'gufw'                                  # Firewall manager    
    'htop'                                  # Process viewer
    'neofetch'                              # Shows system info when you launch terminal
    'cpufetch-git'                          # Shows info about the CPU
    'firmware-manager'                      # System-76 firmware manager
    'openssh'                               # SSH connectivity tools
    'p7zip'                                 # 7z compression program
    'rsync'                                 # Remote file sync utility
    'speedtest-cli'                         # Internet speed via terminal      
    'tlp'                                   # Advanced laptop power management
    'unrar'                                 # RAR compression program
    'unzip'                                 # Zip compression program
    'wget'                                  # Remote content retrieval
    'terminator'                            # Terminal emulator
    'vim'                                   # Terminal Editor
    'zip'                                   # Zip compression program
    'zsh'                                   # ZSH shell
    'zsh-syntax-highlighting'               # Tab completion for ZSH
    'zsh-autosuggestions'                   # Tab completion for ZSH
    'zsh-theme-powerlevel10k'               # Theme for zsh
    'tttf-meslo-nerd-font-powerlevel10k'    # Fonts for zsh
    'fzf'                                   # Terminal finder


    # DISK UTILITIES ------------------------------------------------------

    'android-tools'         # ADB for Android
    'android-file-transfer' # Android File Transfer
    'autofs'                # Auto-mounter
    'btrfs-progs'           # BTRFS Support  
    'exfat-utils'           # Mount exFat drives
    'gparted'               # Disk utility
    'gvfs-mtp'              # Read MTP Connected Systems
    'gvfs-smb'              # More File System Stuff
    'nautilus-share'        # File Sharing in Nautilus
    'ntfs-3g'               # Open source implementation of NTFS file system
    'parted'                # Disk utility  
    'smartmontools'         # Disk Monitoring
    'smbclient'             # SMB Connection 
    'xfsprogs'              # XFS Support

    # GENERAL UTILITIES ---------------------------------------------------

    'flameshot'                 # Screenshots
    'brave-nightly-bin'         # Chromium based Browser
    'firefox'                   # Web Browser
    'libvncserver'              # VNC Connections
    'cheese'                    # Webcam utilty
    'okular'                    # PDF Viewer
    'discord'                   # Voice and text chat platform
    'kotatogram-desktop-bin'    # Alternative version of telegram
    'qbittorrent'               # Torrent
    'veracrypt'                 # Disc encryption utility


    # DEVELOPMENT ---------------------------------------------------------

    'gedit'                 # Text editor
    'gnuplot'               # Tool for plotting math equations and data set
    'cmake'                 # Cross-platform open-source make system
    'code'                  # Visual Studio Code
    'octave'                # FOSS version of Matlab
    'git'                   # Version control system
    'gcc'                   # C/C++ compiler
    'glibc'                 # C libraries
    'meld'                  # File/directory comparison
    'nodejs'                # Javascript runtime environment
    'npm'                   # Node package manager
    'python'                # Scripting language
    
    # MEDIA ---------------------------------------------------------------

    'simplescreenrecorder'  # Screen recorder
    'obs-studio'            # Advanced screen recorder
    'celluloid'             # Video player
    'youtube-dl'            # Comand line tool for downloading yt videos
    'nomacs'                # Simple photo viewer and editor
    'vlc'                   # Video player
    
    # GRAPHICS AND DESIGN -------------------------------------------------

    'gcolor2'               # Colorpicker
    'gimp'                  # GNU Image Manipulation Program
    'ristretto'             # Multi image viewer
    'inkscape'              # Vectorial graphics

    # PRODUCTIVITY --------------------------------------------------------

    'hunspell'              # Spellcheck libraries
    'hunspell-en'           # English spellcheck library
    'hunspell-it'           # Italian spellcheck library
    'xpdf'                  # PDF viewer

)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    paru -S --noconfirm "$PKG" 
done

echo "
###############################################################################
# Done. May the force be with you
###############################################################################
"