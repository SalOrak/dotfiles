#!/bin/bash

set -o errexit

# Create directory
mkdir -p /opt/software/

# Go to directory
cd /opt/software

# Git Clone
git clone git://git.savannah.gnu.org/emacs -b emacs-29.3 --single-branch --depth=1  /opt/software/emacs

# Go git root dir
cd /opt/software/emacs

# Create autoconf
./autogen.sh

### Dependencies
sudo apt install -y texinfo
sudo apt install -y libgtk-3-dev libwebkit2gtk-4.0-dev
sudo apt install -y libgnutls28-dev
sudo apt install -y libjansson-dev
sudo apt install -y libtree-sitter-dev
sudo apt install -y libtinfo-dev libncurses-dev
sudo apt install -y libgccjit-11-dev

# Configure Emacs
./configure \ 
--with-pgtk \
--without-x \
--with-json \
--with-mailutils \
--with-tree-sitter \
--with-json 

# Make 
make -j$(nproc)


