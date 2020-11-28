#!/bin/sh

killall polybar

if [ $? -ne 0 ]; then
    polybar example
else
    bspc config top_padding 0
fi
