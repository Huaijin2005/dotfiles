#!/usr/bin/env bash

# Add this script to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# # Launch the bar
# if type "xrandr"; then
#    # multi-screen
#    for m in $(polybar --list-monitors | cut -d":" -f1); do
#      MONITOR=$m polybar -r main -c config.ini &
#    done
# else
#    polybar -r main -c config.ini &
# fi

polybar -r main -c ~/.config/polybar/config.ini &
