#!/bin/bash

#DEBUG
#cat /sys/class/backlight/amdgpu_bl0/actual_brightness
#cat /sys/class/backlight/amdgpu_bl0/brightness

#BRIGHTNESS=`cat /sys/class/backlight/amdgpu_bl0/actual_brightness`
BRIGHTNESS=`cat /sys/class/backlight/amdgpu_bl0/brightness`
MAX_BRIGHT=`cat /sys/class/backlight/amdgpu_bl0/max_brightness`

case "$1" in
  up)
    BRIGHTNESS=$((BRIGHTNESS + 32))
    if [ $BRIGHTNESS -gt $MAX_BRIGHT ] ; then BRIGHTNESS=$MAX_BRIGHT ; fi
    echo $BRIGHTNESS > /sys/class/backlight/amdgpu_bl0/brightness
  ;;

  down)
    BRIGHTNESS=$((BRIGHTNESS - 32))
    if [ $BRIGHTNESS -lt 0 ] ; then BRIGHTNESS=0 ; fi
    echo $BRIGHTNESS > /sys/class/backlight/amdgpu_bl0/brightness
  ;;
esac
