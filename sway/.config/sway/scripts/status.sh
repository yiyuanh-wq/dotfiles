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

while true
do
    date_time=$(date +'%Y-%m-%d %X')
    volume=$(get_volume)
    echo "$date_time | Volume: $volume"
    sleep 1
done
