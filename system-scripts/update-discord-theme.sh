#!/bin/bash

# Paths for pywal colors and Vencord theme
WAL_COLORS="$HOME/.cache/wal/colors.json"
DISCORD_THEME="$HOME/.config/vesktop/themes/pywal.css"

# Ensure pywal has been run
if [ ! -f "$WAL_COLORS" ]; then
  echo "Pywal colors not found. Run 'wal -i <image>' to generate colors."
  exit 1
fi

# Extract the current hex colors from pywal's JSON file
foreground=$(jq -r '.colors.color15' "$WAL_COLORS")
cursor=$(jq -r '.special.cursor' "$WAL_COLORS")
color0=$(jq -r '.colors.color0' "$WAL_COLORS")
color1=$(jq -r '.colors.color1' "$WAL_COLORS")
color2=$(jq -r '.colors.color2' "$WAL_COLORS")
color3=$(jq -r '.colors.color3' "$WAL_COLORS")
color4=$(jq -r '.colors.color4' "$WAL_COLORS")
color5=$(jq -r '.colors.color5' "$WAL_COLORS")
color6=$(jq -r '.colors.color6' "$WAL_COLORS")
color7=$(jq -r '.colors.color7' "$WAL_COLORS")
color8=$(jq -r '.colors.color8' "$WAL_COLORS")
color9=$(jq -r '.colors.color9' "$WAL_COLORS")
color10=$(jq -r '.colors.color10' "$WAL_COLORS")
color11=$(jq -r '.colors.color11' "$WAL_COLORS")
color12=$(jq -r '.colors.color12' "$WAL_COLORS")
color13=$(jq -r '.colors.color13' "$WAL_COLORS")
color14=$(jq -r '.colors.color14' "$WAL_COLORS")
color15=$(jq -r '.colors.color15' "$WAL_COLORS")
background=$(jq -r '.special.background' "$WAL_COLORS")

# Create the Vencord theme CSS file using system colors
mkdir -p "$(dirname "$DISCORD_THEME")"
cat > "$DISCORD_THEME" <<EOL
:root {
	--wal-foreground: $foreground;
	--wal-cursor: $cursor;

	--wal-color-0-black: $color0;
	--wal-color-1-red: $color1;
	--wal-color-2-green: $color2;
	--wal-color-3-yellow: $color3;
	--wal-color-4-blue: $color4;
	--wal-color-5-purple: $color5;
	--wal-color-6-cyan: $color6;
	--wal-color-7-white: $color7;

	--wal-color-8-bright-black: $color8;
	--wal-color-9-bright-red: $color9;
	--wal-color-10-bright-green: $color10;
	--wal-color-11-bright-yellow: $color11;
	--wal-color-12-bright-blue: $color12;
	--wal-color-13-bright-purple: $color13;
	--wal-color-14-bright-cyan: $color14;
	--wal-color-15-bright-white: $color15;

	--wal-background: $background;
}

/* Text selection color */
::selection {
	color: var(--wal-foreground);
	background: var(--wal-color-12-bright-blue);
}

/* Discord theme customizations */
.theme-dark {
	--channels-default: var(--wal-foreground);
	--background-primary: var(--wal-background);
	--home-background: var(--wal-background);
	--interactive-normal: var(--wal-foreground);
	--header-primary: var(--wal-foreground);
	--brand-experiment: var(--wal-color-10-bright-green);
	--background-secondary: var(--wal-color-0-black);
	--scrollbar-auto-thumb: var(--wal-color-2-green);
	--scrollbar-auto-track: var(--wal-color-3-yellow);
}

.theme-light {
	--text-normal: var(--wal-foreground);
}
EOL

echo "Discord theme generated successfully! Reload Vencord to apply the changes."

