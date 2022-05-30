#!/usr/bin/env sh

if [ -z $WAYLAND_DISPLAY ]; then
    current_wid=$(xdo id)
    selection=$(rofi -i -dmenu $@ < $(dirname $0)/kaomoji.txt)
    kaomoji=$(echo $selection | sed "s|$(echo -e "\ufeff").*||")
    echo -n "$kaomoji" | xclip -selection clipboard
    xdotool key --window $current_wid --clearmodifiers ctrl+v
else
    kaomoji=$(rofi -i -dmenu -p kaomoji $@ < $(dirname $0)/kaomoji.txt | sed "s|$(echo -e "\ufeff").*||")
    wtype "$kaomoji"
fi
