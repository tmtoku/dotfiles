#!/bin/bash

# Disable beep sounds
# echo 'blacklist pcspkr' | sudo tee -a /etc/modprobe.d/blacklist.conf

# For AMD GPU #####
## Change the backlight brightness
echo 10 | sudo tee /sys/class/backlight/amdgpu_bl0/brightness
## Stop screen flickering
echo '
Section "Device"
    Identifier "AMD"
    Driver "amdgpu"
    Option "TearFree" "true"
EndSection
' | sudo tee -a /etc/X11/xorg.conf.d/20-amdgpu.conf
###################

# For KDE and i3wm #####
sudo rm /usr/share/xsessions/i3*
echo '
[Desktop Entry]
Type=XSession
Exec=env KDEWM=/usr/bin/i3 /usr/bin/startplasma-x11
DesktopNames=KDE
Name=Plasma with i3
Comment=Plasma with i3
' | sudo tee /usr/share/xsessions/plasma-i3.desktop
###################

# Adjust the clock
sudo timedatectl set-ntp true

# Change the default shell
chsh -s $(which zsh)

# Reboot
sudo shutdown -r now
