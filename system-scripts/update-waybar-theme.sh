#!/bin/bash

# Path to pywal colors.json
COLORS_FILE="$HOME/.cache/wal/colors.json"

# Extract colors using jq (make sure jq is installed)
BG_COLOR=$(jq -r '.colors.color4' < "$COLORS_FILE")
FG_COLOR=$(jq -r '.colors.color0' < "$COLORS_FILE")
HIGHLIGHT_COLOR=$(jq -r '.colors.color2' < "$COLORS_FILE")

# Update the Waybar CSS
WAYBAR_CSS="$HOME/.config/waybar/style.css"
cat <<EOL > "$WAYBAR_CSS"
* {
  border: none;
  font-family: 'Fira Code', 'Symbols Nerd Font Mono';
  font-size: 13px;
  font-feature-settings: '"zero", "ss01", "ss02", "ss03", "ss04", "ss05", "cv31"';
  min-height: 1px;
  margin-bottom: 0;
}

window#waybar {
  background: transparent;
}

/* Custom styling for modules on the left */
#custom-arch, #workspaces, #custom-media, #custom-launcher, #custom-playerctl, #custom-prev, #custom-next, #cpu, #memory {
  border-radius: 10px;
  background-color: $BG_COLOR;
  color: $FG_COLOR;
  margin-top: 5px;
  margin-right: 15px;
  padding-top: 1px;
  padding-left: 10px;
  padding-right: 10px;
}

#workspaces button {
  background: $BG_COLOR;
  color: $FG_COLOR;
}

/* Custom styling for modules on the right */
#clock, #backlight, #pulseaudio, #bluetooth, #network, #battery, #power-profiles-daemon, #custom-power, #idle_inhibitor, #temperature, #tray {
  border-radius: 10px;
  background-color: $BG_COLOR;
  color: $FG_COLOR;
  margin-top: 5px;
  padding-left: 10px;
  padding-right: 10px;
  margin-right: 15px;
}

/* Remove right margin and border on arch, bluetooth, cpu, and brightness */
#custom-arch, #bluetooth, #backlight, #cpu {
  margin-right: 0;
  border-radius: 10px 0 0 10px;

}

/* Remove left margin and border on audio, network, ram, and workspaces */
#pulseaudio, #network, #workspaces, #memory {
  margin-left: 0;
  border-radius: 0 10px 10px 0;
}

#custom-prev, #custom-playerctl, #custom-next {
  border-radius: 0;
  margin-left: 0;
  margin-right: 0;
  border-left: 1px solid $BG_COLOR;
}

#custom-arch {
  margin-left: 15px;
}

#custom-prev {
  border-radius: 10px 0 0 10px;
}

#custom-next {
  border-radius: 0 10px 10px 0;
}
EOL

