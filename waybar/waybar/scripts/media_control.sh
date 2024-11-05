#!/bin/bash

# Get the current status of the player
status=$(playerctl status 2>/dev/null)

# Get artist and title information
artist=$(playerctl metadata artist 2>/dev/null)
title=$(playerctl metadata title 2>/dev/null)

# Determine the icon and status to show
if [ "$status" = "Playing" ]; then
    icon=""  # Play icon
elif [ "$status" = "Paused" ]; then
    icon=""  # Pause icon
else
    icon=""  # Stop icon
fi

# Format the output
if [ -n "$artist" ] && [ -n "$title" ]; then
    echo "{\"text\": \"$icon $artist - $title\", \"class\": \"playing\"}"
else
    echo "{\"text\": \"No Media\", \"class\": \"stopped\"}"
fi

