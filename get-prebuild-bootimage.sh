#!/bin/bash

# Define variables for file paths:
BOOT_PATH="/dev/block/by-name/boot$(adb shell getprop ro.boot.slot_suffix)"
DTBO_PATH="/dev/block/by-name/dtbo$(adb shell getprop ro.boot.slot_suffix)"

# Ensure adb is available and the device is connected:
command -v adb &>/dev/null || { echo -e "Error: adb not found. Please install adb.\n"; exit 1; }

# Ensure the device is in root mode:
adb root || { echo -e "Error: Failed to get root access via adb.\n"; exit 1; }

mkdir -p prebuild

# Pull the boot image:
echo -e "Pulling boot image...\n"
adb pull "$BOOT_PATH" && mv -f boot_* prebuild/boot.img || { echo -e "Error: Failed to pull or rename boot image.\n"; exit 1; }

# Pull the dtbo image:
echo -e "Pulling dtbo image...\n"
adb pull "$DTBO_PATH" && mv -f dtbo_* prebuild/dtbo.img || { echo -e "Error: Failed to pull or rename dtbo image.\n"; exit 1; }

# Success message (optional):
echo -e "Boot and dtbo images successfully pulled and renamed.\n"
