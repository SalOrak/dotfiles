#!/bin/bash

set -o errexit

# Tofi :) Extremely fast and simple dmenu/rofi replamecemnt
# for wlroots-based Wayland compositors.

## Dependencies
dependencies=(
    "libfreetype-dev"
    "libcairo2-dev"
    "libpango1.0-dev"
    "libwayland-dev"
    "libxkbcommon-dev"
    "libharfbuzz-dev"
)
echo "[Tofi] Installing dependencies"
for dep in ${dependencies[@]}; do 
    sudo apt install -y $dep --quiet
done

## Build-time Dependencies
buildDep=(
    "meson"
    "scdoc"
    "wayland-protocols"
)
echo "[Tofi] Installing build-time dependencies"
for dep in ${buildDep[@]}; do 
    sudo apt install -y $dep --quiet
done

# Create directory
mkdir -p /opt/software/ 

# Git clone
git clone https://github.com/philj56/tofi.git /opt/software/tofi

# Build
meson build

# Install
sudo ninja -C build install
