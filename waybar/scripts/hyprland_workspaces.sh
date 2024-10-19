#!/bin/bash

# Get the active workspace and workspace list from hyprctl
active_workspace=$(hyprctl workspaces -j | jq -r '.[] | select(.focused == true) | .id')
workspaces=$(hyprctl workspaces -j | jq -r '.[] | .id')

# Prepare workspace string for Waybar
output=""
for ws in $workspaces; do
    if [ "$ws" == "$active_workspace" ]; then
        # Highlight active workspace
        output+="%{F#00FF00}[$ws]%{F-} "
    else
        output+="$ws "
    fi
done

# Output formatted string for Waybar
echo $output

