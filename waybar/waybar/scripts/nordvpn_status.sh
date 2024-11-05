#!/bin/bash

# Get NordVPN status
status=$(nordvpn status | grep -E 'Status|Country' | awk -F: '{print $2}' | xargs)

# Determine if VPN is connected or not
if [[ "$status" == *"Connected"* ]]; then
    country=$(echo "$status" | grep -oP 'Country: \K\w+')
    echo "{\"text\": \" $country\", \"class\": \"connected\"}"
else
    echo "{\"text\": \" Disconnected\", \"class\": \"disconnected\"}"
fi

