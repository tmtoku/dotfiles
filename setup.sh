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
mkdir -p ${HOME}/.config/systemd/user
echo '
[Unit]
Description=Launch Plasma with i3
Before=plasma-workspace.target

[Service]
ExecStart=/usr/bin/i3
Restart=on-failure

[Install]
WantedBy=plasma-workspace.target
' | sudo tee ${HOME}/.config/systemd/user/plasma-i3.service
systemctl mask plasma-kwin_x11.service --user
systemctl enable plasma-i3 --user
###################

# Adjust the clock
sudo timedatectl set-ntp true
sudo hwclock -D --systohc --localtime

# Change the default shell
chsh -s $(which zsh)

# Reboot
sudo shutdown -r now
