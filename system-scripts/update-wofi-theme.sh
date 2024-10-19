#!/bin/bash

# Path to pywal colors.json
COLORS_FILE="$HOME/.cache/wal/colors.json"

# Extract colors using jq (make sure jq is installed)
BG_COLOR=$(jq -r '.colors.color0' < "$COLORS_FILE")
FG_COLOR=$(jq -r '.colors.color7' < "$COLORS_FILE")
HIGHLIGHT_COLOR=$(jq -r '.colors.color4' < "$COLORS_FILE")

# Update the Wofi CSS
WOFI_CSS="$HOME/.config/wofi/style.css"
cat <<EOL > "$WOFI_CSS"
*{
  border: none;
  box-shadow: none;
  outline: none;
}

window {
  font-size: 14px;
  font-family: "JetBrains Mono";
  background-color: $BG_COLOR;
  border-radius: 8px;
  opacity: 0.90;
}

#outer-box {
  margin: 10px 10px 20px 10px;
  background-color: $BG_COLOR;
  opacity: 0.90;
}

#inner-box {
  margin: 10px;
  background-color: $BG_COLOR;
  opacity: 0.90;
}

#entry {
  padding: 5px 10px;
  border-radius: 20px;
}

#entry #text {
  padding: 0px 0px 0px 10px;
  font-weight: normal;
  color: $FG_COLOR;
}

#entry:selected {
  background-color: $HIGHLIGHT_COLOR;
}

#entry:selected #text {
  padding: 0px 0px 0px 10px;
  font-weight: normal;
  color: $BG_COLOR;
}

#input {
  background: transparent;
  margin: 0px 5px 0px 20px;
  color: $FG_COLOR;
  padding: 5px;
}

#image {
  margin-left: 20px;
  margin-right: 20px;
}

#scroll {
  margin: 0px;
}
EOL

# Optionally restart Wofi if you want to test it immediately
echo "Wofi colors updated!"

