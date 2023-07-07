#!/bin/zsh

local wallpaper=$(find $HOME/.local/share/hyprpaper -type f | shuf -n 1)
# local wallpaper="$HOME/.local/share/hyprpaper/tablet-2560x1700.jpg"
echo -ne "preload = $wallpaper\nwallpaper = ,$wallpaper" > $HOME/.config/hypr/hyprpaper.conf
hyprpaper
