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

# Configuring main Tablet 
xsetwacom --set "$pad" Button 1 "key ctrl d"   # Duplicate
xsetwacom --set "$pad" Button 2 "key del"      # Clear screen
xsetwacom --set "$pad" Button 3 "key n"        # Pencil
xsetwacom --set "$pad" Button 8 "key ctrl z"   # Undo
# xsetwacom --set "$pad" Button 8 "key shift e" # Eraser

# Configuring Stylus buttons
xsetwacom --set "$stylus" Button 3 "key shift" # Start straight line 
