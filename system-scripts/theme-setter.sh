# Randomly chooses and sets a wallpaper and corresponding colorscheme every set interval
# Uses swww to set the wallpaper and pywal to set the colorscheme

# Set the interval in minutes
interval=10

# Set the wallpaper directory
wallpaper_dir="$HOME/Pictures/wallpapers"


# Main Logic
pkill waybar
# Choose a random wallpaper
wallpaper=$(ls $wallpaper_dir | shuf -n 1)
# Set the wallpaper
swww img $wallpaper_dir/$wallpaper --transition-type center
# Set the colorscheme
wal -i $wallpaper_dir/$wallpaper
# Update firefox theme
pywalfox update
# Update waybar
~/system-scripts/update-waybar-theme.sh
waybar &
#update cava
~/system-scripts/update-cava-theme.sh

# Update Discord theme
~/system-scripts/update-discord-theme.sh

# Update wofi theme
pkill wofi
~/system-scripts/update-wofi-theme.sh
