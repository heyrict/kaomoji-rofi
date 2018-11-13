#!/usr/bin/env bash

selection=$(rofi -i -dmenu $@ < $(dirname $0)/kaomoji.txt)
kaomoji=$(echo $selection | sed "s|$(echo -e "\ufeff").*||")
xdotool type --clearmodifiers "$kaomoji"
