#!/bin/bash


# Update 
sudo apt update 

# Upgrade
sudo apt upgrade -y

# Install dependencies
sudo apt --quiet install xclip -y
sudo apt --quiet install curl -y

# i3
sudo apt --quiet install i3 -y

# feh (background)
sudo apt --quiet install feh -y

# picom (transparency)
sudo apt --quiet install picom -y

# fd-find (grep substitut)
sudo apt --quiet install fd-find -y

# fzf
sudo apt --quiet install fzf -y

# tmux
sudo apt --quiet install tmux -y

# flameshot
sudo apt --quiet install flameshot -y
