sudo apt install git gnome-tweak-tool gnome-shell-extensions chrome-gnome-shell -y
# Creo le rispettive directory
mkdir ~/.themes
mkdir ~/.icons
#Themes
echo "### TEMI ###"
git clone https://github.com/vinceliuice/WhiteSur-gtk-theme.git ~/MacOS-MTT/themes
cd MacOS-MTT/themes
./install.sh -c dark -c light --icon standard
./tweaks.sh -f -F -c dark -c light
sudo ./tweaks.sh -g -b default
cd ~
#Icons
echo "### ICONE ###"

git clone https://github.com/vinceliuice/WhiteSur-icon-theme ~/MacOS-MTT/icons
cd MacOS-MTT/icons
./install.sh -d $HOME/.icons

echo "### APPLICO MODIFICHE"

gsettings set org.gnome.mutter center-new-windows 'true'
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize:'
gsettings set org.gnome.desktop.interface gtk-theme "WhiteSur-dark"
gsettings set org.gnome.desktop.wm.preferences theme "WhiteSur-dark"
gsettings set org.gnome.desktop.interface icon-theme 'BigSur'
