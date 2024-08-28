#!/usr/bin/env bash

CONFIG="~/.config/hypr/wofi/config/config"
STYLE="~/.config/hypr/wofi/src/mocha/style.css"

if [[ ! $(pidof wofi) ]]; then
    wofi --show drun --conf "${CONFIG}" --style "${STYLE}"
else
    pkill wofi
fi
