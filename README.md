# dotfiles

## Usage
```
# Update initial packages
sudo pacman-mirrors --geoip && sudo pacman -Syu && paccache -ruk0
# Install some packages
sudo pacman -S make git firefox bitwarden
# Prepare this dotfiles
cd ${HOME}
git clone https://github.com/qtmm/dotfiles.git
cd dotfiles
# Install 'essential' packages
make essential
# After some settings, install 'basic' packages
make basic
# Additional settings and reboot
./setup.sh
# Install 'optional' packages, if necessary
make optional
```
