#!/bin/bash

Errors=()

declare -A dotfiles


dotfiles[xclip]="CLI for clipboard."
dotfiles[curl]="Download and upload data with URL syntax."
dotfiles[i3]="Minimalist tiling window manager."
dotfiles[feh]="Image viewer utilities. Set background."
dotfiles[picom]="Transparency windows."
dotfiles[fd-find]="Find entries alternatively to find."
dotfiles[fzf]="Command line fuzzy finder."
dotfiles[tmux]="Terminal multiplexer."
dotfiles[flameshot]="Take screenshoots."
dotfiles[peek]="Take gifs."

function isInstalled() {
    package=$1
    dpkg-query -s $package &>/dev/null
    if [[ $?  -eq 0 ]];then
	return 0	
    else
	return 1
    fi
}

function aptif() {
    package=$1
    echo -e "\e[36m[LOG]: Installing \e[33m$package\e[37m\e[36m --> ${dotfiles[$package]}\e[0m"
    isInstalled $package
    if [[ $? -eq 0 ]];then 
	echo -e "[\e[1;32mSUCCESS]: \e[4m$package\e[0m\e[1;32m already installed\e[0m"
    else 
	sudo apt-get install -qq -y --no-show-upgraded --no-upgrade $package 1>/dev/null
	if [[ $? -eq 0 ]];then
	    echo -e "[\e[1;32mSUCCESS]: Installing $package --> \e[1;32m${dotfiles[$package]}\e[0m"
	else 
	    echo -e "[\e[1;31mERROR\e[0m]: An error occurred installing \e[1;31m$package\e[0m"
	    Errors+=("$package")
	fi
    fi
}

for el in "${!dotfiles[@]}"; do
    aptif $el
done

if [[ "${#Errors[@]}" -eq 0 ]]; then
    echo -e "\n[\e[1;32mSUCCESS\e[0m]: All packages have been successfully installed.\e[0m"
else
    echo -e "\n\e[1;36m[LOG]: Errors occurred during installation of the following packages -->\e[0m]"
    for err in "${Errors[@]}"; do
        echo -e "\tUnable to install \e[1;31m$err\e[0m used as ${dotfiles[$err]}"
    done
fi

