#!/usr/bin/env bash

# @author Joachim Schuster
# @license This code is licensed under MIT license (see LICENSE for details)

#let script exit if a command fails
set -o errexit 

#let script exit if an unsed variable is used
set -o nounset

adb_devices=$(adb devices | tail -n +2 | awk '{print $1}')

device_count=$(wc -l <<< "$adb_devices" | bc)

case $device_count in
1)
    # only one device attached, no selection needed
    selected_device=$adb_devices
    ;;
*)
    PS3="Select the device ('Q' to quit): "
    select selected_device in $adb_devices
    do
        case $REPLY in
            [qQ]) exit 1 ;; # quit selection
        esac
        case $selected_device in
            "") continue ;; # invalid selection
            *)  break ;; # valid selection
        esac
    done
    ;;
esac

echo "-s $selected_device"
