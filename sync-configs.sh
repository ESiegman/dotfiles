#!/bin/bash

# Directories for Neovim and Hyprland configs
NVIM_CONFIG_DIR="$HOME/.config/nvim"
HYPR_CONFIG_DIR="$HOME/.config/hypr"
REPO_NVIM_DIR="$HOME/arch-linux-configs/nvim"
REPO_HYPR_DIR="$HOME/arch-linux-configs/hypr"

# Function to replace repository files from .config (Commit changes)
commit_changes() {

    # Sync Neovim directory
    echo "Syncing Neovim..."
    rm -rf "$REPO_NVIM_DIR"   # Remove existing directory in the repo to avoid conflicts
    cp -r "$NVIM_CONFIG_DIR" "$REPO_NVIM_DIR"

    # Sync Hyprland directory
    echo "Syncing Hyprland..."
    rm -rf "$REPO_HYPR_DIR"   # Remove existing directory in the repo to avoid conflicts
    cp -r "$HYPR_CONFIG_DIR" "$REPO_HYPR_DIR"

    echo "Directories copied to the repository. Ready to commit."
}

# Function to copy repository files to .config (Fetch changes)
fetch_changes() {

    # Fetch Neovim directory
    echo "Fetching Neovim..."
    rm -rf "$NVIM_CONFIG_DIR"   # Remove existing .config directory to avoid conflicts
    cp -r "$REPO_NVIM_DIR" "$NVIM_CONFIG_DIR"

    # Fetch Hyprland directory
    echo "Fetching Hyprland..."
    rm -rf "$HYPR_CONFIG_DIR"   # Remove existing .config directory to avoid conflicts
    cp -r "$REPO_HYPR_DIR" "$HYPR_CONFIG_DIR"

    echo "Directories copied to .config. Configuration restored."
}

# Check the mode provided by the user (commit or fetch)
if [ "$1" == "commit" ]; then
    commit_changes
elif [ "$1" == "fetch" ]; then
    fetch_changes
else
    echo "Usage: $0 [commit|fetch]"
    exit 1
fi

