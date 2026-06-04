# Manjaro Linux (KDE Plasma + i3)

## Details
- **OS**: Manjaro Linux (KDE Plasma)
- **Window Manager**: i3
- **Compositor**: picom
- **Launcher**: Rofi
- **Shell**: zsh
- **Terminal**: ghostty

## Usage
Prerequisite: You should download Manjaro Linux (Plasma, Minimal) from [the official website](https://manjaro.org/download/)

1. Update initial packages
   ```sh
   sudo pacman-mirrors --geoip && sudo pacman -Syu && paccache -ruk0
   ```
1. Install make and git
   ```sh
   sudo pacman -S make git
   ```
1. Download this repository
   ```sh
   cd ${HOME}
   git clone https://github.com/tmtoku/dotfiles.git
   cd dotfiles
   ```
1. Install 'minimal' packages
   ```sh
   make minimal
   ```
1. Install 'basic' packages
   ```sh
   make basic
   ```
1. Additional settings and reboot
   ```sh
   ./setup.sh
   sudo shutdown -r now
   ```
1. Install 'development' or 'optional' packages, if necessary
   ```sh
   make development
   make optional
   ```
