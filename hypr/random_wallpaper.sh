#!/bin/zsh

local wallpaper=$(find $HOME/.local/share/hyprpaper -type f | shuf -n 1)
echo -ne "preload = $wallpaper\nwallpaper = ,$wallpaper" > $HOME/.config/hypr/hyprpaper.conf
hyprpaper
