#!/bin/bash

# Define the list of configuration files/directories
CONFIGS=(
    "nvim"
    "waybar"
    "kitty"
    "waybar"
    "ranger"
    "wofi"
    "hypr"
    "wlogout"
    "fastfetch"
    "cava"
    "btop"
    "kitty"
)

# Define the source directory (repository folder)
REPO_DIR="$HOME/dotfiles"  # Change this to your actual repository folder

# Define the target directory for configs (~/.config)
CONFIG_DIR="$HOME/.config"

# Define the directory for wallpapers in the repository
WALLPAPER_REPO_DIR="$REPO_DIR/wallpapers"

# Define the target directory for wallpapers
WALLPAPER_DIR="$HOME/Pictures/wallpapers"

# Define the .zshrc file
ZSHRC_FILE="$HOME/.zshrc"
ZSHRC_REPO_FILE="$REPO_DIR/.zshrc"

# Define the system-scripts directory
SYSTEM_SCRIPTS_DIR="$HOME/system-scripts"
SYSTEM_SCRIPTS_REPO_DIR="$REPO_DIR/system-scripts"


# Check the first argument (push or pull)
if [ "$1" == "push" ]; then
    echo "Syncing local configurations to the repository..."

    # Copy configurations from system to the repository
    for config in "${CONFIGS[@]}"; do
        echo "Copying $CONFIG_DIR/$config to $REPO_DIR/$config"
        cp -r "$CONFIG_DIR/$config" "$REPO_DIR/$config"
    done

    echo "Copying wallpapers to $WALLPAPER_REPO_DIR..."
    mkdir -p "$WALLPAPER_REPO_DIR"
    cp -r "$WALLPAPER_DIR/"* "$WALLPAPER_REPO_DIR/"

    echo "Copying .zshrc to $ZSHRC_REPO_FILE..."
    cp "$ZSHRC_FILE" "$ZSHRC_REPO_FILE"

    echo "Copying system-scripts to $SYSTEM_SCRIPTS_REPO_DIR..."
    mkdir -p "$SYSTEM_SCRIPTS_REPO_DIR"
    cp -r "$SYSTEM_SCRIPTS_DIR/"* "$SYSTEM_SCRIPTS_REPO_DIR/"

    echo "Committing and pushing changes to GitHub..."
    git -C "$REPO_DIR" add .
    git -C "$REPO_DIR" commit -m "Update configurations, wallpapers, and scripts"
    git -C "$REPO_DIR" push origin main  # Replace 'main' with your branch name if different

    echo "Push to GitHub completed."
elif [ "$1" == "pull" ]; then
    echo "Pulling latest changes from GitHub..."

    git -C "$REPO_DIR" pull origin main  
    echo "Pull from GitHub completed."

    echo "Copying configurations to $CONFIG_DIR..."
    for config in "${CONFIGS[@]}"; do
        echo "Copying $REPO_DIR/$config to $CONFIG_DIR/$config"
        cp -r "$REPO_DIR/$config" "$CONFIG_DIR/$config"
    done

    echo "Copying wallpapers to $WALLPAPER_DIR..."
    mkdir -p "$WALLPAPER_DIR"
    cp -r "$WALLPAPER_REPO_DIR/"* "$WALLPAPER_DIR/"

    echo "Copying .zshrc to $ZSHRC_FILE..."
    cp "$ZSHRC_REPO_FILE" "$ZSHRC_FILE"

    echo "Copying system-scripts to $SYSTEM_SCRIPTS_DIR..."
    mkdir -p "$SYSTEM_SCRIPTS_DIR"
    cp -r "$SYSTEM_SCRIPTS_REPO_DIR/"* "$SYSTEM_SCRIPTS_DIR/"

    echo "Pull and local sync completed."
else
    echo "Usage: $0 [push|pull]"
    exit 1
fi
