#!/bin/bash
# Simple battery info script for i3status (for drivers missing capacity)

BAT="/sys/class/power_supply/BAT1"
if [ ! -d "$BAT" ]; then
    echo "  no batt"
    exit 0
fi

energy_now=$(cat "$BAT/energy_now" 2>/dev/null)
energy_full=$(cat "$BAT/energy_full" 2>/dev/null)
status=$(cat "$BAT/status" 2>/dev/null)

# Avoid division by zero
if [ -z "$energy_full" ] || [ "$energy_full" -eq 0 ]; then
    echo "  err"
    exit 0
fi

percent=$(( 100 * energy_now / energy_full ))

# Pick icon based on level
if [ "$status" = "Charging" ]; then
    icon=""
elif [ "$percent" -ge 80 ]; then
    icon=""
elif [ "$percent" -ge 60 ]; then
    icon=""
elif [ "$percent" -ge 40 ]; then
    icon=""
elif [ "$percent" -ge 20 ]; then
    icon=""
else
    icon=""
fi

echo "$icon ${percent}%"
