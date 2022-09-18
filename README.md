![banner](https://github.com/Putu-Justine/termux-desktop-xfce/blob/master/github-assets/banner.png)
# What's this?
Yet another automated setup for xfce. Made by therealmodder/riaru.
# Purpose of this rice
Well, This setup inspired by Yisus7u7 Desktop. and no, this is not a fork. 
# Requirements
- Android 7.0+
- VNC Client
- Maybe 2GB of ram? i didn't check the minimum
- And termux itself.

# Screenshots
| Location | Screenshots |
| --- | --- |
| **Desktop** | ![desktop](https://github.com/Putu-Justine/dotfiles/blob/master/github-assets/desktop.png) |
| **GTK3 Apps with libxfceui** | ![gtk3xfceui](https://github.com/Putu-Justine/dotfiles/blob/master/github-assets/gtk3-with-xfceui.png) |
| **GTK3 & QT5 Apps** | ![gtk3qt5](https://github.com/Putu-Justine/dotfiles/blob/master/github-assets/gtk3-and-qt5.png) |

# Installation (Arch Linux Only, fresh install)
Install the deps first :
```
xorg-server i3-gaps nitrogen xfce4-notifyd brightnessctl dex light-locker alacritty pcmanfm-gtk3 scrot rofi dmenu lxappearance-gtk3 lightdm lightdm-webkit2-greeter noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-font-awesome gtk-engine-murrine polybar papirus-icon-theme pipewire pipewire-alsa pipewire-pulse pipewire-jack
```
Optional but recommended :
```
arandr gpicview l3afpad lxtask-gtk3 pavucontrol mpv copyq
```
Then from AUR :
```
picom-git volantes-cursors
```
Optional but recommended from AUR :
```
uwufetch polkit-dumb-agent-git qt5-styleplugins gtk3-classic cava libxfce4ui-nocsd
```
Clone my dots and copy to the desired folders
```
git clone https://github.com/Putu-Justine/dotfiles.git
cd dotfiles
cp -r configs/* ~/.config
sudo cp -r themes/* /usr/share/themes
sudo cp -r lightdm-themes/* /usr/share/lightdm-webkit/themes
sudo cp -r wallpapers/* /usr/share/pixmaps
```
Don't forget to enable lightdm service & set lightdm greeter to webkit one. See [ArchWiki](https://wiki.archlinux.org/title/LightDM#Greeter) for more details.
```
sudo systemctl enable lightdm.service
```
```
greeter-session=lightdm-webkit2-greeter
```
And you are done! Continue to the post-install section.
# Post Install
On the first login, polybar and i3 will load successfuly, but nitrogen does not. 

To fix it, Open Nitrogen (via Super+D, from rofi) and click preferences. Add directory for wallpapers (on my setup i put it on ```/usr/share/pixmaps```) and click OK. Select the wallpapers and click apply.

For GTK themes, open lxappearance, under "Widget", select ```Materia-moredark-compact```, for fonts select ```Noto Sans CJK JP Regular```, under "Icon theme" select ```Papirus Dark```, under "Mouse cursor" select ```Volantes Cursors```.

For Qt themes, (i assumed you installed qt5-styleplugins) open ```/etc/environment``` using your favourite text editor and put this lines on the bottom of the text : ```QT_QPA_PLATFORMTHEME=gtk2```

For notifications, run ```xfce4-notifyd-config``` from rofi, and change default position to bottom right.

For LightDM, open/create ```/etc/lightdm/lightdm-webkit2-greeter.conf``` with your favourite text editor, find ```webkit_theme``` strings, and change the value to ```moredark``` until it looked like this :
```
webkit_theme        = moredark
```
Save it and reboot.

# Keybindings
- ```Super + L``` Lockscreen
- ```Super + W``` Terminal
- ```Super + E``` File Manager
- ```Super + D``` Application Menu
- ```Print``` Screenshot
- ```Super + Q``` Quit an app
- ```Super + 1 ... 0``` Switch workspace

For more keybindings, go to ```~/.config/i3/config```

# Special: STFU Mode
This feature is actually from EvanKoe dots and it still used in this dots!

To access it, press ```Super + BackSpace``` key to enter STFU Mode.

Press again ```Super + BackSpace``` key to exit STFU Mode.

On this Mode, pressing :
- ```Ctrl + S``` to shutdown the system.
- ```r``` key to reboot.
- ```l``` key to log out. like as EvanKoe intended to.

# Special: Display Manager (Switcher?)
I don't even know EvanKoe dots had this until i see it under his i3 configs. and of course this thing still being used on this dots.

To access it, press ```Super + P``` to enter this mode.

Press ```Super + P``` again to exit.

On this mode, pressing :
- ```R``` key to extend display to the right side.
- ```L``` key to extend display to the left side.
- ```D``` key to duplicate main display to the second display.
- ```N``` key to disable the second display.

# Special: Compositor Enabler/Disabler
Want to play osu!mania but picom running in the background as a compositor making the game latency higher. So i created this mode to make it easy to turn off the compositor.

To access it, press ```Ctrl + Super + C``` to enter this mode.

Press ```Ctrl + Super + C``` again to exit.

On this mode, pressing :
- ```S``` key to kickstart picom again after it got killed.
- ```K``` key to kill picom. (via ```killall```)

# Special thanks
- [rxyhn](https://github.com/rxyhn) For Picom config files and Rofi custom theme.
- [EvanKoe](https://github.com/EvanKoe) For i3-gaps & alacritty config files.
- [ldy3112](https://github.com/ldy3112) For helping me on polybar stuff and make me stay on i3-gaps.
- [nana-4](https://github.com/nana-4) For the Materia GTK Theme. (dark-compact variant)
- [dimaglushkov](https://github.com/dimaglushkov) For the lightdm webkit themes as a base.
- Rectify11 Team for the wallpapers.