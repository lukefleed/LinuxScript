sudo apt install git gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell cairo-dock -y
mkdir ~/.themes
mkdir ~/.icons
#Themes
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git ~/MacOS-MTT/themes
cd MacOS-MTT/themes
./install.sh -c dark -c light
./tweaks.sh -f -e -F -s -d -c dark 
sudo ./tweaks.sh -g -b default
cd ~
#Icons
git clone https://github.com/vinceliuice/WhiteSur-icon-theme ~/MacOS-MTT/icons
cd MacOS-MTT/icons
./install.sh -d $HOME/.icons
