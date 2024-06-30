#!/usr/bin/env sh

CURRENT_WIFI="$(sudo wdutil info)"
SSID="$(networksetup -getairportnetwork en0 | sed 's/Current Wi-Fi Network: //')"
CURR_TX="$(echo "$CURRENT_WIFI" | grep "Tx Rate" | sed 's/.*Tx Rate.*: //')"

if [ "$SSID" = "" ]; then
  sketchybar --set wifi label="Disconnected" icon=睊
else
  sketchybar --set wifi label="$SSID" icon=󰖩
fi
