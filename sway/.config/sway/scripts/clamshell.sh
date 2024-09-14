#!/bin/bash

laptop="eDP-1"
external="DP-3"

if swaymsg -t get_outputs | grep -q "$external"; then
    swaymsg output $laptop disable
    swaymsg output $external enable
else
    swaymsg output $laptop enable
    swaymsg output $external disable
fi
