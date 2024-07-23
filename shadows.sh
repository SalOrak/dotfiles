#!/bin/bash 

# First we execute and install the everything
./configure.sh INSTALL

# Then, install the shadow files
./configure.sh INSTALL --dotfiles ~/personal/shadows/DOTS --start-dir ~/personal/shadows


