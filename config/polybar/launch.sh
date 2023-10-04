#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

# Launch bars
echo "---" | tee -a /tmp/bar-main.log /tmp/bar-left.log /tmp/bar-right.log
polybar bar-main 2>&1 | tee -a /tmp/bar-main.log & disown
[[ "${DEVICE}" = "PC" ]] && polybar bar-left 2>&1 | tee -a /tmp/bar-left.log & disown
[[ "${DEVICE}" = "PC" ]] && polybar bar-right 2>&1 | tee -a /tmp/bar-right.log &disown

echo "Bars launched..."
