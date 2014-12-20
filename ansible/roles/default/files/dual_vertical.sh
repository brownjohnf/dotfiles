#!/bin/bash

# mini-displayport
xrandr --output HDMI2 --rotate left

# mini-HDMI
xrandr --output HDMI1 --rotate left

# put mini-HDMI left of displayport
xrandr --output HDMI1 --left-of HDMI2
