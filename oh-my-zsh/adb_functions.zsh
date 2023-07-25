#!/usr/bin/env bash

# @author Joachim Schuster
# @license This code is licensed under MIT license (see LICENSE for details)

# Select a device to be used in all subsequent adb executions.
adbdevice() {
    # shellcheck disable=SC2139,SC2086
    alias adb="adb $($ZSH_CUSTOM/adb_select_device.sh)"
}

# Attention!
# Use 'eval' in the functions to make them use the adb alias!
# Otherwise the original adb without the device parameter will be used

# Set font scale - use values from 0.8 to 1.30
adbfont() { eval adb shell settings put system font_scale "$1"; }

# Set proxy to use your current developer machine
# Optional: proxy port - default is 8888
adbsetproxy() {
    port="${1:=8888}"; # use default 8888 port if no port is provided as first parameter
    eval adb shell settings put global http_proxy "$(currentip):$port"; 
}

# Unset proxy
adbunsetproxy() { eval adb shell settings put global http_proxy :0; }

currentip() { ipconfig getifaddr "$(route get example.com | grep interface | awk '{print $2}')"; }

# Simple login automation
# sends a tab key event to focus the first input field and fills the username
# sends a second tab key to focus the next input field and fills the password
# confirms the form with a return key event after sleeping a secund 
adblogin() {
    username="${1}";
    password="${2}";
    eval adb shell input keyevent 61;
    eval adb shell input text "$username";
    eval adb shell input keyevent 61;
    eval adb shell input text "$password";
    sleep 1
    eval adb shell input keyevent 66;
}
