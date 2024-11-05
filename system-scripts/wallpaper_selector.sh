#!/bin/bash

# Directory containing wallpapers
wallpaper_dir="$HOME/Pictures/wallpapers"

# Function to set wallpaper and update themes
set_wallpaper() {
    local wallpaper="$1"

    # Set the wallpaper
    swww img "$wallpaper" --transition-type center

    # Set the colorscheme
    wal -i "$wallpaper"

    # Update Firefox theme
    pywalfox update

    # Update Waybar
    pkill waybar
    ~/system-scripts/update-waybar-theme.sh
    waybar &

    # Update Cava theme
    ~/system-scripts/update-cava-theme.sh

    # Update Discord theme
    ~/system-scripts/update-discord-theme.sh

    # Update Wofi theme
    pkill wofi
    ~/system-scripts/update-wofi-theme.sh
}

# List wallpapers and let the user select one with wofi
selected_wallpaper=$(ls "$wallpaper_dir" | wofi --dmenu --prompt "Select Wallpaper")

if [ -n "$selected_wallpaper" ]; then
    set_wallpaper "$wallpaper_dir/$selected_wallpaper"
else
    echo "No wallpaper selected."
fi

