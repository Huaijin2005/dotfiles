#!/bin/bash
pkill picom
sleep 0.2
picom --config ~/.config/picom/picom.conf -b
# 检测HDMI是否连接
if xrandr | grep -q "HDMI-1-0 connected"; then
    feh --bg-fill ~/Pictures/disco3.png ~/Pictures/disco2.jpg
else
    feh --bg-fill ~/Pictures/disco3.png
fi
