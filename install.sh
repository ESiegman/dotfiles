#!/bin/bash

# Define the base directory of the dotfiles repo
DOTFILES_DIR="$(pwd)"

# Function to install yay if not already present
install_yay() {
    # Check if yay command is available
    if ! command -v yay &>/dev/null; then
        echo "Installing yay..."
        # Clone the yay repository from AUR and install it
        git clone https://aur.archlinux.org/yay.git /tmp/yay
        cd /tmp/yay || exit
        makepkg -si --noconfirm
        cd - || exit
    else
        echo "yay is already installed."
    fi
}

# Function to install packages using pacman or yay
install_packages() {
    echo "Installing required packages..."

    # List of required packages
    local packages=("cava" "hyprland" "kitty" "neovim" "waybar" "wlogout" "wofi" 
                    "zsh" "git" "curl" "pywal" "firefox" "pywalfox" "fzf" "bat"
                    "exa" "btop" 
                    )

    # Loop through each package and install it if not already installed
    for pkg in "${packages[@]}"; do
        if ! pacman -Qi "$pkg" &>/dev/null; then
            echo "Package $pkg not found with pacman, trying yay..."
            # Use yay to install the package if not found with pacman
            yay -S --needed "$pkg" --noconfirm
        else
            echo "$pkg is already installed."
        fi
    done

    # Set zsh as the default shell for the current user
    chsh -s "$(which zsh)" "$USER"
}

# Install Oh My Zsh
install_oh_my_zsh() {
    # Check if Oh My Zsh is already installed
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo "Installing Oh My Zsh..."
        # Install Oh My Zsh using the unattended install script
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    else
        echo "Oh My Zsh is already installed."
    fi
}

# Function to install plugins from GitHub
install_zsh_plugins_from_github() {
    echo "Installing Zsh plugins from GitHub..."

    # Create the custom plugins directory if it doesn't exist
    PLUGIN_DIR="$HOME/.oh-my-zsh/custom/plugins"
    mkdir -p "$PLUGIN_DIR"

    # Array of GitHub repositories for each plugin
    declare -A plugins=(
    ["zsh-syntax-highlighting"]="https://github.com/zsh-users/zsh-syntax-highlighting.git"
    ["zsh-autosuggestions"]="https://github.com/zsh-users/zsh-autosuggestions.git"
    ["fast-syntax-highlighting"]="https://github.com/zdharma-continuum/fast-syntax-highlighting.git"
    ["zsh-completions"]="https://github.com/zsh-users/zsh-completions.git"
    ["zsh-history-substring-search"]="https://github.com/zsh-users/zsh-history-substring-search.git"
    ["powerlevel10k"]="https://github.com/romkatv/powerlevel10k.git"
    ["you-should-use"]="https://github.com/MichaelAquilina/zsh-you-should-use.git"
    ["fzf-tab"]="https://github.com/Aloxaf/fzf-tab.git"
    ["alias-tips"]="https://github.com/djui/alias-tips.git"
    ["zsh-z"]="https://github.com/agkozak/zsh-z.git"
    ["z"]="https://github.com/rupa/z.git"
  )

    # Clone each plugin repository if it is not already installed
    for plugin in "${!plugins[@]}"; do
        if [ ! -d "$PLUGIN_DIR/$plugin" ]; then
            echo "Installing $plugin..."
            git clone "${plugins[$plugin]}" "$PLUGIN_DIR/$plugin"
        else
            echo "$plugin is already installed."
        fi
    done
}

# Function to copy configuration directories
copy_config() {
    local src="$1"  # Source directory or file
    local dest="$2" # Destination directory or file
    # Backup the destination if it already exists
    if [ -e "$dest" ]; then
        echo "Backing up existing $dest to $dest.bak"
        mv "$dest" "$dest.bak"
    fi
    # Copy the source to the destination
    cp -r "$src" "$dest"
    echo "Copied $src to $dest"
}

# Set up configuration files and directories
setup_configs() {
    echo "Copying configuration files and directories..."

    # Copy each configuration directory or file to the appropriate location
    copy_config "$DOTFILES_DIR/cava" "$HOME/.config/cava"
    copy_config "$DOTFILES_DIR/fastfetch" "$HOME/.config/fastfetch"
    copy_config "$DOTFILES_DIR/hypr" "$HOME/.config/hypr"
    copy_config "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
    copy_config "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"
    copy_config "$DOTFILES_DIR/waybar" "$HOME/.config/waybar"
    copy_config "$DOTFILES_DIR/wlogout" "$HOME/.config/wlogout"
    copy_config "$DOTFILES_DIR/wofi" "$HOME/.config/wofi"
    copy_config "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"

    # Copy wallpapers to ~/Pictures
    copy_config "$DOTFILES_DIR/wallpapers" "$HOME/Pictures/wallpapers"

    # Copy scripts to directory
    copy_config "$DOTFILES_DIR/system-scripts" "$HOME/system-scripts"
}

# Main function to orchestrate the installation and setup
main() {
    # Install yay if not already installed
    install_yay
    # Install required packages
    install_packages
    # Install Oh My Zsh
    install_oh_my_zsh
    # Set up configuration files and directories
    setup_configs
    # Install Zsh plugins from GitHub
    install_zsh_plugins_from_github
    echo "Setup complete! Please restart your terminal to use zsh."
}

# Execute the main function
main

