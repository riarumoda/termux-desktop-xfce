#!/data/data/com.termux/files/usr/bin/env bash

# Preload paths
UDIR="/data/data/com.termux/files/usr"
PKGLOG="$UDIR/tmp/pkginstall.log"
touch $PKGLOG

# Clear Anything on the screen first
echo 'Clearing the screen...'
cd $HOME
sleep 1
clear

# Welcome Screen
echo "  __  _______ ____ _____  "
echo "  \ \/ /  ___/ ___| ____| "
echo "   \  /| |_ | |   |  _|   "
echo "   /  \|  _|| |___| |___  "
echo "  /_/\_\_|   \____|_____| "
echo "                          "
echo "  Yet another  xfce setup "
echo "   on termux.  by riaru.  "
echo "                          "
echo "           Note:          "
echo "   Install speed depends  "
echo "     on your  internet    "
echo "        connection.       "
echo " "
sleep 5

# Install some packages
echo '- Updating packages (1/9)'
sleep 3
apt update
clear
echo '- Upgrading packages (2/9)'
sleep 3
apt upgrade -y
clear
echo '- Installing X11 repo (3/9)'
sleep 3
apt install x11-repo -y
clear
echo '- Updating packages (4/9)'
sleep 3
apt update
clear
echo '- Installing essential packages (5/9)'
sleep 3
apt install xfce4 xfce4-goodies synaptic pavucontrol-qt pulseaudio kvantum papirus-icon-theme git wget tigervnc qt5ct -y
sleep 1
clear

# Now install some external stuff that does not available on termux repo
echo '- Installing Materia GTK Theme (6/9)'
sleep 3
wget https://github.com/Putu-Justine/termux-desktop-xfce/raw/master/materia-gtk-theme.tar.xz >> $PKGLOG 2>&1
tar -xvf materia-gtk-theme.tar.xz >> $PKGLOG 2>&1
mv Materia $UDIR/share/themes
mv Materia-compact $UDIR/share/themes
mv Materia-dark $UDIR/share/themes
mv Materia-dark-compact $UDIR/share/themes
mv Materia-light $UDIR/share/themes
mv Materia-light-compact $UDIR/share/themes
clear
echo '- Installing Materia Kvantum Theme (7/9)'
sleep 3
git clone https://github.com/PapirusDevelopmentTeam/materia-kde >> $PKGLOG 2>&1
cp -r materia-kde/Kvantum/* $UDIR/share/Kvantum
sleep 1
clear

# Install pre-configured data to $HOME
echo '- Installing Pre-configured data to $HOME (8/9)'
wget https://github.com/Putu-Justine/termux-desktop-xfce/raw/master/riaru-desktop-data.tar.xz >> $PKGLOG 2>&1
tar -xvf riaru-desktop-data.tar.xz >> $PKGLOG 2>&1
echo "export QT_QPA_PLATFORMTHEME=qt5ct" >> $HOME/.bashrc
sleep 1
clear

# Setting up a fake xdg-desktop-dirs
echo '- Setting up a fake xdg-user-dirs (9/9)'
sleep 3
termux-setup-storage
ln -sf /storage/emulated/0/Download $HOME/Downloads
ln -sf /storage/emulated/0/Documents $HOME/Documents
ln -sf /storage/emulated/0/Movies $HOME/Videos
ln -sf /storage/emulated/0/Pictures $HOME/Pictures
ln -sf /storage/emulated/0/Music $HOME/Music

# Clean up, but silent
rm -rf materia-kde
rm -f materia-gtk-theme.tar.xz
rm -f riaru-desktop-data.tar.xz
sleep 1

# And done ig
clear
echo " "
echo "And... it's Done!"
echo "To start the desktop, just type :"
echo " "
echo "vncserver -listen tcp :1"
echo " "
echo "and, after you're done with it, type:"
echo " "
echo "vncserver -kill :1"
echo " "
echo "Note: ALWAYS. remember to stop the desktop"
echo "before stopping termux itself from running."
echo " "
echo "Now Please close and open termux to start using it."
sleep 3
