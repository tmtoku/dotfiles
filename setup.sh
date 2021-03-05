#!/bin/bash

# Disable beep sounds
echo 'blacklist pcspkr' | sudo tee -a /etc/modprobe.d/blacklist.conf

# For AMD GPU #####
# Change the backlight brightness
echo 10 | sudo tee /sys/class/backlight/amdgpu_bl0/brightness
###################

# Adjust the clock
sudo timedatectl set-ntp true

# Update initial packages
sudo pacman-mirrors --geoip && sudo pacman -Syu && paccache -ruk0

# Install essential packages
make essential

# Change the default shell
chsh -s $(which zsh)

# Reboot
sudo shutdown -r now
