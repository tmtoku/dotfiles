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

# Adjust the clock
sudo timedatectl set-ntp true

# Change the default shell
chsh -s $(which zsh)

# Reboot
sudo shutdown -r now
