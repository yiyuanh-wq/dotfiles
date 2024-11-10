#!/bin/bash

get_volume() {
    volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    if [[ $volume == *"MUTED"* ]]; then
        echo "MUTED"
    else
        percent=$(echo $volume | awk '{print int($2 * 100)}')
        echo "${percent}%"
    fi
}

get_battery() {
    if [ -f "/sys/class/power_supply/BAT0/capacity" ]; then
        bat_level=$(cat /sys/class/power_supply/BAT0/capacity)
        bat_status=$(cat /sys/class/power_supply/BAT0/status)
        echo "${bat_level}%"
    else
        echo "No battery"
    fi
}

while true
do
    date_time=$(date +'%Y-%m-%d %X')
    volume=$(get_volume)
    battery=$(get_battery)
    echo "$date_time | Volume: $volume | Battery: $battery"
    sleep 1
done
