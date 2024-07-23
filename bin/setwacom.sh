#!/bin/bash

# Pen id: 14  type: STYLUS 
# Pad id: 21  type: PAD 

stylus="Wacom Intuos S Pen stylus"
pad="Wacom Intuos S Pad pad"

# Modifiers and keys
# ctrl ctl control lctrl rctrl meta lmeta rmeta alt lalt ralt
# shift lshift rshift super lsuper rsuper hyper lhyper rhyper
# f1 - f35 esc Esc up down left right backspace Backspace
# return tab PgUp PgDn del home end insert
# ` - = [ ] \ ; ' , .  / ~ ! @ # $ % ^ & * () _ + { }
# | : " < > ?

# Configuring main Tablet  --> Rnote
xsetwacom --set "$pad" Button 1 "key ctrl 5"   # Selector
xsetwacom --set "$pad" Button 2 "key ctrl 2"   # Shaper
xsetwacom --set "$pad" Button 3 "key ctrl l"   # Clear screen
xsetwacom --set "$pad" Button 8 "key ctrl z"   # Undo
# xsetwacom --set "$pad" Button 8 "key shift e" # Eraser

# Configuring Stylus buttons
xsetwacom --set "$stylus" Button 3 "key ctrl 1" # Brush
