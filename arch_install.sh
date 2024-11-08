#!/bin/bash

# Variables
DOTFILES_REPO="https://github.com/ESiegman/dotfiles.git"
DOTFILES_DIR="$HOME/dotfiles"
BACKUP_DIR="$HOME/dotfiles_backup"

# Array of packages available via pacman (for Arch-based distributions)
PACMAN_PACKAGES=(
  "zsh" "git" "zsh-syntax-highlighting" "zsh-autosuggestions" 
  "kitty" "neovim" "python-pynvim" "hyprland" "wlroots" "waybar" 
  "networkmanager" "pulseaudio" "wofi" "wlogout" "fastfetch" "cava" "ranger" "ueberzug"
)

# Powerlevel10k theme URL for zsh
POWERLEVEL10K_REPO="https://github.com/romkatv/powerlevel10k.git"

# Detect package manager and install packages
if command -v pacman &>/dev/null; then
  echo "Detected Arch-based system. Using pacman for package installation."
  sudo pacman -Syu --needed --noconfirm "${PACMAN_PACKAGES[@]}"
else
  echo "No supported package manager detected. Please install packages manually."
  exit 1
fi

# Step 2: Clone the dotfiles repository
if [ -d "$DOTFILES_DIR" ]; then
  echo "Dotfiles directory already exists. Pulling the latest changes..."
  git -C "$DOTFILES_DIR" pull
else
  echo "Cloning dotfiles repository..."
  git clone "$DOTFILES_REPO" "$DOTFILES_DIR"
fi

# Step 3: Set up Zsh plugins and Powerlevel10k
echo "Setting up Zsh plugins and Powerlevel10k theme..."
if [ ! -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]; then
  git clone --depth=1 "$POWERLEVEL10K_REPO" "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
fi

# Step 4: Install Vim-Plug for Neovim
echo "Installing Vim-Plug for Neovim..."
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Step 5: Backup existing dotfiles and copy new configurations
echo "Backing up existing dotfiles to $BACKUP_DIR and copying new configurations..."
mkdir -p "$BACKUP_DIR"

# Function to copy files and backup existing ones
copy_file() {
  local src=$1
  local dest=$2
  if [ -e "$dest" ]; then
    echo "Backing up $dest"
    mv "$dest" "$BACKUP_DIR/"
  fi
  echo "Copying $src to $dest"
  cp -r "$src" "$dest"
}

# Zsh and Powerlevel10k
copy_file "$DOTFILES_DIR/.zshrc" "$HOME/.zshrc"
copy_file "$DOTFILES_DIR/.p10k.zsh" "$HOME/.p10k.zsh"

# Kitty
mkdir -p "$HOME/.config/kitty"
copy_file "$DOTFILES_DIR/kitty/kitty.conf" "$HOME/.config/kitty/kitty.conf"

# Hyprland
mkdir -p "$HOME/.config/hypr"
copy_file "$DOTFILES_DIR/hypr/hyprland.conf" "$HOME/.config/hypr/hyprland.conf"

# Waybar
mkdir -p "$HOME/.config/waybar"
copy_file "$DOTFILES_DIR/waybar/config" "$HOME/.config/waybar/config"
copy_file "$DOTFILES_DIR/waybar/style.css" "$HOME/.config/waybar/style.css"

# Wofi
mkdir -p "$HOME/.config/wofi"
copy_file "$DOTFILES_DIR/wofi/config" "$HOME/.config/wofi/config"
copy_file "$DOTFILES_DIR/wofi/style.css" "$HOME/.config/wofi/style.css"

# Wlogout
mkdir -p "$HOME/.config/wlogout"
copy_file "$DOTFILES_DIR/wlogout/config" "$HOME/.config/wlogout/config"

# Fastfetch
mkdir -p "$HOME/.config/fastfetch"
copy_file "$DOTFILES_DIR/fastfetch/config.conf" "$HOME/.config/fastfetch/config.conf"

# Cava
mkdir -p "$HOME/.config/cava"
copy_file "$DOTFILES_DIR/cava/config" "$HOME/.config/cava/config"

# Ranger
mkdir -p "$HOME/.config/ranger"
copy_file "$DOTFILES_DIR/ranger/rc.conf" "$HOME/.config/ranger/rc.conf"

# Neovim
mkdir -p "$HOME/.config/nvim"
copy_file "$DOTFILES_DIR/nvim/init.vim" "$HOME/.config/nvim/init.vim"

# Step 6: Copy Wallpapers
echo "Copying wallpapers..."
mkdir -p "$HOME/Pictures/wallpapers"
cp -r "$DOTFILES_DIR/wallpapers/"* "$HOME/Pictures/wallpapers/"

# Step 7: Set Zsh as the default shell
if [ "$SHELL" != "$(which zsh)" ]; then
  echo "Setting Zsh as the default shell..."
  chsh -s "$(which zsh)"
fi

echo "Dotfiles installation and setup complete!"
echo "Please log out or restart for some changes to take full effect."

