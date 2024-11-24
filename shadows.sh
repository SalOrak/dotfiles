#!/bin/bash 


dots="DOTS"

if [[ $(uname) == "Darwin" ]]; then
    dots="${dots}_MAC"
fi

# First we execute and install the everything
./configure.sh INSTALL --dotfiles $dots

# Then, install the shadow files
./configure.sh INSTALL --dotfiles ~/personal/shadows/$dots --start-dir ~/personal/shadows


