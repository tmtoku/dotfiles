#!/bin/bash

xprop -spy -root _NET_CURRENT_DESKTOP |
while read -r event
do
    ws_num=$(i3-msg -t get_workspaces |\
        jq ".[] | select(.focused==true) | .num")
    feh --bg-fill "${HOME}/.config/i3/wallpapers/${ws_num}.jpg"
done
