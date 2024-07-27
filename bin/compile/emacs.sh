#!/bin/bash

set -o errexit

# Create directory
mkdir -p /opt/software/

# Go to directory
cd /opt/software

if [[ ! -d /opt/software/emacs ]]; then
	# Git Clone
	git clone git://git.savannah.gnu.org/emacs -b emacs-29.3 --single-branch --depth=1  /opt/software/emacs
fi

# Go git root dir
cd /opt/software/emacs

### Dependencies
sudo apt install -y autoconf

# Create autoconf
./autogen.sh

### Dependencies
sudo apt install -y texinfo
sudo apt install -y libgtk-3-dev libwebkit2gtk-4.0-dev
sudo apt install -y libgnutls28-dev
sudo apt install -y libjansson-dev
sudo apt install -y libtree-sitter-dev
sudo apt install -y libtinfo-dev libncurses-dev
sudo apt install -y libgccjit-12-dev # Version should be the same of gcc
sudo apt install -y libmagickwand-dev # ImageMagick deps
sudo apt install -y libxpm-dev
sudo apt install -y libgif-dev

# Configure Emacs
./configure \
--with-native-compilation=aot \
--with-x \
--with-imagemagick \
--with-json \
--with-mailutils \
--with-tree-sitter \
--with-json \
CFLAGS="-O2 -march=native"

# Make 
make -j$(nproc)

# Install
sudo make install
