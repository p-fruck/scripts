#!/bin/bash
# Installation:
#  sudo apt install evemu-tools
# Add the following line to /etc/sudoers
# <username> ALL=(ALL) NOPASSWD:/usr/bin/evtest

device="/dev/input/by-path/platform-thinkpad_acpi-event"

mode_tablet='*type 5 (EV_SW), code 1 (SW_TABLET_MODE), value 1*'
mode_laptop='*type 5 (EV_SW), code 1 (SW_TABLET_MODE), value 0*'

/usr/bin/evtest --grab "$device"

# Attach code below to evtest command for custom hook on switch event
#| while read line; do
#    case $line in
#        ($mode_tablet)     echo "Switched to tabletmode" ;;
#        ($mode_laptop)     echo "Switched to laptopmode" ;;
#    esac
#done
