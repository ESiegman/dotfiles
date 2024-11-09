# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export GBM_BACKEND=nvidia-drm
export WLR_NO_HARDWARE_CURSORS=1
# Set ZSH theme to Powerlevel10k
ZSH_THEME="powerlevel10k/powerlevel10k"
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Set the PATH
export PATH="$HOME/.local/bin:$PATH"

# Plugin List
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-completions
    zsh-history-substring-search
    you-should-use
    fzf-tab
    alias-tips
    zsh-z
    z
    sudo              # Automatically use sudo when you get permission errors
    colored-man-pages # Adds colors to man pages
    command-not-found # Suggests similar commands when you mistype
    web-search        # Quick web searches from your terminal
)

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Custom Aliases
alias grep='grep --color=auto'
alias files='ranger'
alias edit-script='nvim ~/.zshrc'
alias script-done='source ~/.zshrc'
alias github='github-desktop'
alias edit-startup='sudo nvim /etc/systemd/system/startup-script.sh'
alias steam='prime-run steam --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WebRTCPipeWireCapturer'
alias chatgpt='chat-gpt'
alias chrome='google-chrome-stable'
alias minecraft='prime-run prismlauncher'
alias teams='teams-for-linux'
alias epic='prime-run heroic'
alias aur='pacseek'
alias update-grub='sudo grub-mkconfig -o /boot/grub/grub.cfg'
alias chatgpt='openai-chatgpt-nativefier --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WebRTCPipeWireCapturer'
alias discord='vesktop --enable-features=UseOzonePlatform --ozone-platform=wayland --enable-features=WebRTCPipeWireCapturer'
alias cat='bat'
alias ls='exa --icons --tree --level=2 --color=always --group-directories-first --git'
alias fastfetch-png='fastfetch --logo ~/.config/fastfetch/fastfetch.png --logo-height 21'
alias fastfetch-ascii='fastfetch --logo ~/.config/fastfetch/custom_logo.txt'

# Custom Functions
function custom-commands-list {
    echo "1.  files        - Open ranger file manager"
    echo "2.  edit-script  - Open .zshrc"
    echo "3.  script-done  - Reload .zshrc"
    echo "4.  github       - Open GitHub Desktop"
    echo "5.  chatgpt      - Open ChatGPT Desktop"
    echo "6.  teams        - Open Microsoft Teams"
    echo "7.  epic         - Open Heroic Games Launcher"
    echo "8.  aur          - Open aur searcher"
    echo "9.  vpn          - Connect/Disconnect VPN"
    echo "10. edit-startup - Open startup script"
    echo "11. steam        - Launch Steam using GPU"
    echo "12. update-grub  - Update GRUB"
    echo "13. virt-env     - Activate/Deactivate Python Virtual Environment"
    echo "14. chrome       - Open Google Chrome"
    echo "15. discord      - Open Discord"
    echo "15. config-sys   - Run system configuration script(missing)"
    echo "16. update-sys   - Update system packages"
    echo "17. run-valgrind - Run Valgrind on a C/C++ file"
    echo "18. run-matlab-file - Run a MATLAB script file"
    echo "19. open-matlab-cli - Open MATLAB CLI"
    echo "20. matlab       - Open MATLAB GUI"
    echo "21. git-configs  - Automate git-config process"
}

# Function to connect/disconnect VPN
function vpn {
    if nordvpn status | grep -q "Status: Connected"; then
        echo "You are currently connected to VPN."
        read "choice?Do you want to disconnect? (y/n): "
        if [[ $choice == "y" ]]; then
            nordvpn disconnect
        fi
    else
        echo "You are currently not connected to VPN."
        read "choice?Do you want to connect? (y/n): "
        if [[ $choice == "y" ]]; then
            nordvpn connect
        fi
    fi
}

# Function to activate/deactivate Python Virtual Environment
function virt_env {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        deactivate
    else
        if [ ! -d "./venv" ]; then
            python -m venv venv
        fi
        source ./venv/bin/activate
    fi
}

# Function to update system packages
function update-sys {
    sudo pacman -Syu
    paru -Syu
}

# Function to run Valgrind on a C/C++ file
function run_valgrind() {
    if [ -z "$1" ]; then
        echo "Usage: run_valgrind <source_file.c/cpp>"
        return 1
    fi

    local FILE_EXT="${1##*.}"

    if [ "$FILE_EXT" = "c" ]; then
        COMPILER="gcc"
    elif [ "$FILE_EXT" = "cpp" ]; then
        COMPILER="g++"
    else
        echo "Unsupported file extension: $FILE_EXT"
        return 1
    fi

    local OUTPUT_BIN="a.out"

    $COMPILER -g "$1" -o "$OUTPUT_BIN"
    if [ $? -ne 0 ]; then
        echo "Compilation failed!"
        return 1
    fi

    valgrind --leak-check=full ./"$OUTPUT_BIN"
}

# Function to run a MATLAB script file
function run-matlab-file() {

    # Check if an argument is passed
    if [ -z "$1" ]; then
        echo "Please provide the MATLAB script file (.m) to run."
        exit 1
    fi

    $directory=pwd

    # Get the script file from the first argument
    script_file="$1"

    location="$directory$script_file"

    cp $location ~/matlab

    cd ~/matlab/bin

    # Run MATLAB without GUI
    ./matlab -nosplash -nodesktop -r "run('$script_file');"

    cd $directory
}

# Function to open MATLAB CLI
function run-matlab-cli() {
    cd ~/matlab/bin
    ./matlab -nodisplay -nosplash -nodesktop
}

# Function to open MATLAB GUI
function matlab() {
    cd ~/matlab/bin
    ./matlab
}

# Function to automate git-config process
function git-configs {

    # Check if an argument is passed
    if [ -z "$1" ]; then
        echo "Usage: git-configs <command>"
        echo "Available commands:"
        echo "push, Push changes to the remote repository"
        echo "pull, Pull changes from the remote repository"
        exit 1
    fi

    cd ~/system-scripts
    
    if [ "$1" == "push" ]; then
        ./config-sync.sh push
    elif [ "$1" == "pull" ]; then
        ./config-sync.sh pull
    else
        echo "Invalid command: $1"
        exit 1
    fi

    cd ~
}

fastfetch-png
task list
