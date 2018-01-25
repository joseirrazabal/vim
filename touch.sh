#!/bin/bash
ICONS_PATH=$HOME/scripts/img
OFF=`synclient | grep TouchpadOff | grep 0`

if [ -z "$OFF" ]
then
  synclient TouchpadOff=0
  notify-send -i $ICONS_PATH/touchpad-enable-icon.png -a TDE "Touchpad activado"
else
  synclient TouchpadOff=1
  notify-send -i $ICONS_PATH/touchpad-disable-icon.png -a TDE "Touchpad desactivado"
fi
