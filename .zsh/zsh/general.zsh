# Basic Settings -------------------------

# Enable colors
autoload -Uz colors && colors
# Enable prompt settings
autoload -Uz promptinit && promptinit

# Disable <C-s>, <C-q>
unsetopt FLOW_CONTROL
setopt NO_FLOW_CONTROL

# No beep
setopt NO_BEEP

# Automatically change directory when only dir name is typed
setopt AUTO_CD

# My own keyboard layout
xkbcomp -I${HOME}/.xkb ${HOME}/.xkb/keymap/mykbd ${DISPLAY} 2> /dev/null
